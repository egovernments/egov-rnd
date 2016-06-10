package org.egov.gsdl.service.google;

import com.google.api.services.sheets.v4.Sheets;
import com.google.api.services.sheets.v4.model.BatchUpdateSpreadsheetRequest;
import com.google.api.services.sheets.v4.model.CellData;
import com.google.api.services.sheets.v4.model.ExtendedValue;
import com.google.api.services.sheets.v4.model.GridCoordinate;
import com.google.api.services.sheets.v4.model.Request;
import com.google.api.services.sheets.v4.model.RowData;
import com.google.api.services.sheets.v4.model.Sheet;
import com.google.api.services.sheets.v4.model.Spreadsheet;
import com.google.api.services.sheets.v4.model.UpdateCellsRequest;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

@Service
public class GoogleAPIService {

    private static final HashMap<String, Integer> COLUMN_IDX_MAP = new HashMap<>();
    private static final HashMap<String, Integer> ROW_IDX_MAP = new HashMap<>();
    @Autowired
    private Sheets service;

    public GoogleAPIService() {
        COLUMN_IDX_MAP.put("April", 6);
        COLUMN_IDX_MAP.put("May", 7);
        COLUMN_IDX_MAP.put("June", 8);
        COLUMN_IDX_MAP.put("July", 9);
        COLUMN_IDX_MAP.put("August", 10);
        COLUMN_IDX_MAP.put("September", 11);
        COLUMN_IDX_MAP.put("October", 12);
        COLUMN_IDX_MAP.put("November", 13);
        COLUMN_IDX_MAP.put("December", 14);
        COLUMN_IDX_MAP.put("January", 15);
        COLUMN_IDX_MAP.put("February", 16);
        COLUMN_IDX_MAP.put("March", 17);

        ROW_IDX_MAP.put("ADDANKI",1);
        ROW_IDX_MAP.put("ADONI",2);
        ROW_IDX_MAP.put("ALLAGADDA",3);
        ROW_IDX_MAP.put("AMALAPURAM",4);
        ROW_IDX_MAP.put("AMUDALAVALASA",5);
        ROW_IDX_MAP.put("ANAKAPALLI",6);
        ROW_IDX_MAP.put("ANANTAPUR",7);
        ROW_IDX_MAP.put("ATMAKURKNL",8);
        ROW_IDX_MAP.put("ATMAKURNLR",9);
        ROW_IDX_MAP.put("BAPATLA",10);
        ROW_IDX_MAP.put("BHEEMILI",11);
        ROW_IDX_MAP.put("BHIMAVARAM",12);
        ROW_IDX_MAP.put("BOBBILI",13);
        ROW_IDX_MAP.put("BUDWEL",14);
        ROW_IDX_MAP.put("CHEEMAKURTHY",15);
        ROW_IDX_MAP.put("CHILAKALURIPET",16);
        ROW_IDX_MAP.put("CHIRALA",17);
        ROW_IDX_MAP.put("CHITTOOR",18);
        ROW_IDX_MAP.put("DHARMAVARAM",19);
        ROW_IDX_MAP.put("DHONE",20);
        ROW_IDX_MAP.put("ELURU",21);
        ROW_IDX_MAP.put("GIDDALUR",22);
        ROW_IDX_MAP.put("GOLLAPROLU",23);
        ROW_IDX_MAP.put("GOOTY",24);
        ROW_IDX_MAP.put("GUDIVADA",25);
        ROW_IDX_MAP.put("GUDURKNL",26);
        ROW_IDX_MAP.put("GUDURNLR",27);
        ROW_IDX_MAP.put("GUNTAKAL",28);
        ROW_IDX_MAP.put("GUNTUR",29);
        ROW_IDX_MAP.put("HINDUPUR",30);
        ROW_IDX_MAP.put("ICHAPURAM",31);
        ROW_IDX_MAP.put("JAGGAIAHPET",32);
        ROW_IDX_MAP.put("JAMMALAMADUGU",33);
        ROW_IDX_MAP.put("JANGAREDDYGUDEM",34);
        ROW_IDX_MAP.put("KADAPA",35);
        ROW_IDX_MAP.put("KADIRI",36);
        ROW_IDX_MAP.put("KAKINADA",37);
        ROW_IDX_MAP.put("KALYANADURGAM",38);
        ROW_IDX_MAP.put("KANDUKUR",39);
        ROW_IDX_MAP.put("KANIGIRI",40);
        ROW_IDX_MAP.put("KAVALI",41);
        ROW_IDX_MAP.put("KOVVUR",42);
        ROW_IDX_MAP.put("KURNOOL",43);
        ROW_IDX_MAP.put("MACHERLA",44);
        ROW_IDX_MAP.put("MACHILIPATNAM",45);
        ROW_IDX_MAP.put("MADAKASIRA",46);
        ROW_IDX_MAP.put("MADANAPALLE",47);
        ROW_IDX_MAP.put("MANDAPET",48);
        ROW_IDX_MAP.put("MANGALAGIRI",49);
        ROW_IDX_MAP.put("MARKAPUR",50);
        ROW_IDX_MAP.put("MUMMIDIVARAM",51);
        ROW_IDX_MAP.put("MYDUKUR",52);
        ROW_IDX_MAP.put("NAGARI",53);
        ROW_IDX_MAP.put("NAIDUPET",54);
        ROW_IDX_MAP.put("NANDIGAMA",55);
        ROW_IDX_MAP.put("NANDIKOTKUR",56);
        ROW_IDX_MAP.put("NANDYAL",57);
        ROW_IDX_MAP.put("NARASAPUR",58);
        ROW_IDX_MAP.put("NARASARAOPET",59);
        ROW_IDX_MAP.put("NARSIPATNAM",60);
        ROW_IDX_MAP.put("NELLIMARLA",61);
        ROW_IDX_MAP.put("NELLORE",62);
        ROW_IDX_MAP.put("NIDADAVOLE",63);
        ROW_IDX_MAP.put("NUZIVIDU",64);
        ROW_IDX_MAP.put("ONGOLE",65);
        ROW_IDX_MAP.put("PALAKOL",66);
        ROW_IDX_MAP.put("PALAKONDA",67);
        ROW_IDX_MAP.put("PALAMANER",68);
        ROW_IDX_MAP.put("PALASAKASIBUGGA",69);
        ROW_IDX_MAP.put("PAMIDI",70);
        ROW_IDX_MAP.put("PARVATHIPURAM",71);
        ROW_IDX_MAP.put("PEDANA",72);
        ROW_IDX_MAP.put("PEDDAPURAM",73);
        ROW_IDX_MAP.put("PIDUGURALLA",74);
        ROW_IDX_MAP.put("PITHAPURAM",75);
        ROW_IDX_MAP.put("PONNUR",76);
        ROW_IDX_MAP.put("PRODDATUR",77);
        ROW_IDX_MAP.put("PULIVENDULA",78);
        ROW_IDX_MAP.put("PUNGANUR",79);
        ROW_IDX_MAP.put("PUTTAPARTHY",80);
        ROW_IDX_MAP.put("PUTTUR",81);
        ROW_IDX_MAP.put("RAJAHMUNDRY",82);
        ROW_IDX_MAP.put("RAJAM",83);
        ROW_IDX_MAP.put("RAJAMPET",84);
        ROW_IDX_MAP.put("RAMACHANDRAPURAM",85);
        ROW_IDX_MAP.put("RAYACHOTY",86);
        ROW_IDX_MAP.put("RAYADURG",87);
        ROW_IDX_MAP.put("REPALLE",88);
        ROW_IDX_MAP.put("SALURU",89);
        ROW_IDX_MAP.put("SAMALKOT",90);
        ROW_IDX_MAP.put("SATTENAPALLE",91);
        ROW_IDX_MAP.put("SRIKAKULAM",92);
        ROW_IDX_MAP.put("SRIKALAHASTI",93);
        ROW_IDX_MAP.put("SULLURPETA",94);
        ROW_IDX_MAP.put("TADEPALLI",95);
        ROW_IDX_MAP.put("TADEPALLIGUDEM",96);
        ROW_IDX_MAP.put("TADIPATRI",97);
        ROW_IDX_MAP.put("TANUKU",98);
        ROW_IDX_MAP.put("TENALI",99);
        ROW_IDX_MAP.put("TIRUPATI",100);
        ROW_IDX_MAP.put("TIRUVURU",101);
        ROW_IDX_MAP.put("TUNI",102);
        ROW_IDX_MAP.put("VENKATAGIRI",103);
        ROW_IDX_MAP.put("VIJAYANAGARAM",104);
        ROW_IDX_MAP.put("VIJAYAWADA",105);
        ROW_IDX_MAP.put("VINUKONDA",106);
        ROW_IDX_MAP.put("VISAKHAPATNAM",107);
        ROW_IDX_MAP.put("VUYYURU",108);
        ROW_IDX_MAP.put("YELAMANCHILI",109);
        ROW_IDX_MAP.put("YELESWARAM",110);
        ROW_IDX_MAP.put("YEMMIGANUR",111);
        ROW_IDX_MAP.put("YERRAGUNTLA", 112);

    }

    public static Set<String> getULBS() {
        return ROW_IDX_MAP.keySet();
    }

    public void updateSheet(String spreadsheetId, String sheetId, String ulbName, Double data) {
        try {
            Spreadsheet spreadsheet = service.spreadsheets().get(spreadsheetId).setIncludeGridData(true).execute();
            String currentMonth = new DateTime().toString("MMMM");
            for (Sheet sheet : spreadsheet.getSheets()) {
                if (sheet.getProperties().getTitle().equals(sheetId)) {
                    List<Request> requests = new ArrayList<>();
                    List<CellData> values = new ArrayList<>();
                    values.add(new CellData()
                            .setUserEnteredValue(new ExtendedValue()
                                    .setNumberValue(data)));
                    requests.add(new Request()
                            .setUpdateCells(new UpdateCellsRequest()
                                    .setStart(new GridCoordinate().setSheetId(sheet.getProperties().getSheetId())
                                            .setRowIndex(ROW_IDX_MAP.get(ulbName))
                                            .setColumnIndex(COLUMN_IDX_MAP.get(currentMonth))).setRows(Arrays.asList(
                                            new RowData().setValues(values))).setFields("userEnteredValue")));
                    BatchUpdateSpreadsheetRequest batchUpdateRequest = new BatchUpdateSpreadsheetRequest().setRequests(requests);
                    service.spreadsheets().batchUpdate(spreadsheetId, batchUpdateRequest).execute();
                }
            }
        } catch (IOException e) {
            throw new RuntimeException("Error occurred while updating google spreadsheet : "+spreadsheetId, e);
        }
    }
}
