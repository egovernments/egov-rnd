import os
import io
import json
import streamlit as st
import pandas as pd
from dotenv import load_dotenv

from data_loader import load_from_source
from profiling import profile_sheet, quick_insights
from qa_engine import answer_question
from dashboard import kpis, status_breakdown, owner_workload, upcoming_deadlines, gantt_dataframe, create_share_pack


load_dotenv()

st.set_page_config(page_title="AI Sheets Planner", layout="wide")
st.title("🧠📊 AI Sheets Planner — Campaign & Planning Assistant")

with st.expander("Data Source", expanded=True):
    source_kind = st.radio("Choose a source", ["Google Sheet link", "Excel upload"], horizontal=True)
    sa_bytes = None
    dfs = {}
    if source_kind == "Google Sheet link":
        gsheet_url = st.text_input("Paste Google Sheet URL")
        st.caption("Tip: For multi-tab sheets, upload a Service Account JSON or share the sheet with your service account email.")
        sa_file = st.file_uploader("Upload Google Service Account JSON (optional, recommended)", type=["json"])
        if sa_file is not None:
            sa_bytes = sa_file.read()
        use_env = st.checkbox("Use GOOGLE_SA_PATH from .env if present", value=True)
        if use_env and not sa_bytes and os.getenv("GOOGLE_SA_PATH") and os.path.exists(os.getenv("GOOGLE_SA_PATH")):
            sa_bytes = open(os.getenv("GOOGLE_SA_PATH"), "rb").read()

        if st.button("Load Google Sheet", type="primary", use_container_width=False) and gsheet_url:
            try:
                dfs = load_from_source("gsheet", gsheet_url=gsheet_url, sa_json_bytes=sa_bytes)
                st.success(f"Loaded {len(dfs)} sheet(s)")
                st.session_state["dfs"] = dfs
            except Exception as e:
                st.error(f"Failed to load: {e}")
    else:
        xl_file = st.file_uploader("Upload Excel (.xlsx)", type=["xlsx"])
        if xl_file is not None and st.button("Load Excel", type="primary"):
            try:
                dfs = load_from_source("excel", file_bytes=xl_file.read())
                st.success(f"Loaded {len(dfs)} sheet(s)")
                st.session_state["dfs"] = dfs
            except Exception as e:
                st.error(f"Failed to load: {e}")

dfs = st.session_state.get("dfs", {})

if not dfs:
    st.info("Load a Google Sheet or Excel workbook to begin.")
    st.stop()

# Tabs: Preview, Insights, Ask AI, Export
tab1, tab2, tab3, tab4, tab5 = st.tabs(["🔎 Preview", "💡 Insights", "🤖 Ask AI", "⬇️ Export", "📊 Dashboard & Share"])

with tab1:
    sheet_names = list(dfs.keys())
    sel = st.selectbox("Pick a sheet", sheet_names)
    df = dfs[sel]
    st.write(f"**Rows**: {len(df)} | **Columns**: {len(df.columns)}")
    st.dataframe(df, use_container_width=True)
    st.markdown("**Schema**")
    st.dataframe(profile_sheet(df), use_container_width=True)

with tab2:
    st.subheader("Quick Insights")
    ins = quick_insights(dfs)
    for name, info in ins.items():
        st.markdown(f"### {name}")
        if not info:
            st.write("—")
        else:
            for k, v in info.items():
                st.write(f"- **{k}**: {v}")

with tab3:
    st.subheader("Ask a natural-language question about your data")
    q = st.text_input("Question", placeholder="e.g., Which campaigns are delayed and who owns them?")
    if st.button("Answer", type="primary"):
        with st.spinner("Thinking..."):
            ans = answer_question(q, dfs)
        st.markdown("**Answer**")
        st.write(ans)

with tab4:
    st.subheader("Download Options")
    # Per-sheet CSV exports
    for name, df in dfs.items():
        csv = df.to_csv(index=False).encode("utf-8")
        st.download_button(f"Download '{name}.csv'", csv, file_name=f"{name}.csv", mime="text/csv")
    # Try a naive merge if columns align across sheets
    try:
        cols = None
        merged = []
        for name, df in dfs.items():
            if cols is None:
                cols = list(df.columns)
            if list(df.columns) == cols:
                merged.append(df)
        if merged:
            all_df = pd.concat(merged, ignore_index=True)
            st.write("**Merged (same-schema) rows**:", len(all_df))
            st.dataframe(all_df.head(20), use_container_width=True)
            st.download_button("Download merged.csv", all_df.to_csv(index=False).encode("utf-8"), "merged.csv", "text/csv")
    except Exception as e:
        st.info(f"Merge note: {e}")


with tab5:
    st.subheader("Dashboard")
    k = kpis(dfs)
    c1, c2, c3 = st.columns(3)
    c1.metric("Sheets", k.get("sheets", 0))
    c2.metric("Rows", k.get("rows", 0))
    c3.metric("Campaigns", k.get("campaigns", 0))

    sb = status_breakdown(dfs)
    if not sb.empty:
        st.bar_chart(sb)

    ow = owner_workload(dfs)
    if not ow.empty:
        st.bar_chart(ow)

    ud = upcoming_deadlines(dfs, 45)
    if not ud.empty:
        st.markdown("**Upcoming (≤45 days)**")
        st.dataframe(ud.head(50), use_container_width=True)
    else:
        st.info("No upcoming deadlines detected.")

    gdf = gantt_dataframe(dfs)
    if not gdf.empty:
        st.markdown("**Gantt-ready table (export to Excel for Gantt plotting):**")
        st.dataframe(gdf.head(100), use_container_width=True)

    st.divider()
    st.subheader("Share")
    st.caption("Generate a portable ZIP with CSV snapshots and PNG charts. If your workbook has a 'Dashboard' tab, it will be included.")
    if st.button("Generate Share Pack (.zip)", type="primary"):
        try:
            data = create_share_pack(dfs)
            st.download_button("Download Share Pack", data=data, file_name="ai-sheets-share-pack.zip", mime="application/zip")
            st.success("Share pack is ready.")
        except Exception as e:
            st.error(f"Failed to build share pack: {e}")
