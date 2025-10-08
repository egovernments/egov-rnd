"""
Campaign-specific analytics for HCM Campaign Calendar
"""
from typing import Dict, List, Optional
import pandas as pd
import re


def _find_column(df: pd.DataFrame, patterns: List[str]) -> Optional[str]:
    """Find column by matching patterns (case-insensitive)"""
    for col in df.columns:
        col_lower = str(col).lower()
        for pattern in patterns:
            if pattern.lower() in col_lower:
                return col
    return None


def get_campaign_status_breakdown(df: pd.DataFrame) -> Dict[str, int]:
    """Get breakdown by campaign status"""
    col = _find_column(df, ['campaign status', 'status'])
    if col:
        counts = df[col].value_counts(dropna=True).to_dict()
        # Convert values to int (they may be numpy int64)
        return {str(k): int(v) for k, v in counts.items() if k and str(k).strip()}
    return {}


def get_country_breakdown(df: pd.DataFrame) -> Dict[str, int]:
    """Get breakdown by country"""
    col = _find_column(df, ['country'])
    if col:
        counts = df[col].value_counts(dropna=True).to_dict()
        return {str(k): int(v) for k, v in counts.items() if k and str(k).strip()}
    return {}


def get_campaign_type_breakdown(df: pd.DataFrame) -> Dict[str, int]:
    """Get breakdown by campaign type"""
    col = _find_column(df, ['campaign type', 'type'])
    if col:
        counts = df[col].value_counts(dropna=True).to_dict()
        return {str(k): int(v) for k, v in counts.items() if k and str(k).strip()}
    return {}


def get_partner_breakdown(df: pd.DataFrame) -> Dict[str, int]:
    """Get breakdown by campaign partner"""
    col = _find_column(df, ['campaign partner', 'partner'])
    if col:
        counts = df[col].value_counts(dropna=True).to_dict()
        return {str(k): int(v) for k, v in counts.items() if k and str(k).strip()}
    return {}


def get_quarter_breakdown(df: pd.DataFrame) -> Dict[str, int]:
    """Get breakdown by quarter"""
    col = _find_column(df, ['quarter year', 'quarter'])
    if col:
        counts = df[col].value_counts(dropna=True).to_dict()
        return {str(k): int(v) for k, v in counts.items() if k and str(k).strip()}
    return {}


def get_complexity_breakdown(df: pd.DataFrame) -> Dict[str, int]:
    """Get breakdown by complexity level"""
    col = _find_column(df, ['level of complexity', 'complexity'])
    if col:
        counts = df[col].value_counts(dropna=True).to_dict()
        return {str(k): int(v) for k, v in counts.items() if k and str(k).strip()}
    return {}


def get_infrastructure_breakdown(df: pd.DataFrame) -> Dict[str, int]:
    """Get breakdown by infrastructure"""
    col = _find_column(df, ['infrastructure', 'infra'])
    if col:
        counts = df[col].value_counts(dropna=True).to_dict()
        return {str(k): int(v) for k, v in counts.items() if k and str(k).strip()}
    return {}


def get_timeline_data(df: pd.DataFrame) -> List[Dict]:
    """
    Extract timeline data from monthly columns
    Returns campaign timeline with active months
    """
    timeline_data = []

    # Month columns (Apr 2025 - Mar 2026)
    month_cols = [col for col in df.columns if re.match(r'(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) \d{4}', str(col))]

    campaign_col = _find_column(df, ['campaign name'])
    country_col = _find_column(df, ['country'])
    status_col = _find_column(df, ['campaign status', 'status'])

    if not campaign_col:
        return []

    for idx, row in df.iterrows():
        campaign_name = row.get(campaign_col, '') if campaign_col else ''
        country = row.get(country_col, '') if country_col else ''
        status = row.get(status_col, '') if status_col else ''

        if not campaign_name or pd.isna(campaign_name) or str(campaign_name).strip() == '':
            continue

        # Find active months
        active_months = []
        for month_col in month_cols:
            value = row.get(month_col, '')
            if value and not pd.isna(value) and str(value).strip() != '':
                active_months.append({
                    'month': month_col,
                    'activity': str(value)
                })

        if active_months:
            timeline_data.append({
                'campaign': str(campaign_name).strip(),
                'country': str(country) if country and not pd.isna(country) else '',
                'status': str(status) if status and not pd.isna(status) else '',
                'months': active_months
            })

    return timeline_data


def get_campaign_details(df: pd.DataFrame, campaign_name: str) -> Dict:
    """Get detailed information for a specific campaign"""
    campaign_col = _find_column(df, ['campaign name'])

    if not campaign_col:
        return {}

    # Find the campaign row - use regex=False to treat special characters literally
    mask = df[campaign_col].str.contains(campaign_name, case=False, na=False, regex=False)
    campaign_row = df[mask]

    # If no match, try exact match (case-insensitive)
    if campaign_row.empty:
        mask = df[campaign_col].str.lower() == campaign_name.lower()
        campaign_row = df[mask]

    if campaign_row.empty:
        return {}

    # Get the first match
    row = campaign_row.iloc[0]

    # Build details dictionary
    details = {}
    for col in df.columns:
        value = row[col]
        if pd.notna(value) and str(value).strip() != '':
            details[col] = str(value)

    return details


def get_all_campaigns_list(df: pd.DataFrame) -> List[Dict]:
    """Get list of all campaigns with basic info"""
    campaign_col = _find_column(df, ['campaign name'])
    country_col = _find_column(df, ['country'])
    status_col = _find_column(df, ['campaign status', 'status'])
    type_col = _find_column(df, ['campaign type', 'type'])

    if not campaign_col:
        return []

    campaigns = []
    for idx, row in df.iterrows():
        campaign_name = row.get(campaign_col, '')
        if not campaign_name or pd.isna(campaign_name) or str(campaign_name).strip() == '':
            continue

        campaigns.append({
            'name': str(campaign_name).strip(),
            'country': str(row.get(country_col, '')) if country_col and pd.notna(row.get(country_col)) else '',
            'status': str(row.get(status_col, '')) if status_col and pd.notna(row.get(status_col)) else '',
            'type': str(row.get(type_col, '')) if type_col and pd.notna(row.get(type_col)) else ''
        })

    return campaigns


def get_campaign_summary(df: pd.DataFrame) -> Dict:
    """Get overall campaign summary statistics"""
    # Find country and status columns
    country_col = _find_column(df, ['country'])
    status_col = _find_column(df, ['campaign status', 'status'])

    if not country_col:
        return {
            'total_campaigns': 0,
            'countries': 0,
            'ongoing': 0,
            'yet_to_start': 0
        }

    # Filter out empty rows
    df_clean = df[df[country_col].notna() & (df[country_col] != '')]

    total_campaigns = len(df_clean)
    countries = df_clean[country_col].nunique()

    ongoing = 0
    yet_to_start = 0

    if status_col:
        ongoing = len(df_clean[df_clean[status_col].str.contains('On going', case=False, na=False)])
        yet_to_start = len(df_clean[df_clean[status_col].str.contains('Yet to Start', case=False, na=False)])

    return {
        'total_campaigns': total_campaigns,
        'countries': countries,
        'ongoing': ongoing,
        'yet_to_start': yet_to_start
    }
