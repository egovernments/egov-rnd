package org.egov.gsdl.client;

import org.egov.gsdl.AppConfig;
import org.egov.gsdl.service.elasticsearch.ElasticSearchService;
import org.egov.gsdl.service.elasticsearch.config.ElasticSearchConfig;
import org.egov.gsdl.service.google.GoogleAPIService;
import org.egov.gsdl.service.google.config.GoogleAPIConfig;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.Environment;
import org.springframework.core.env.MapPropertySource;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.support.PeriodicTrigger;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;


public class GoogleSheetDataLoader {
    private static final Logger LOG = LoggerFactory.getLogger(GoogleSheetDataLoader.class);

    public static void main(String[] args) throws IOException {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class,
                ElasticSearchConfig.class, GoogleAPIConfig.class);
        ElasticSearchService elasticSearchService = context.getBean(ElasticSearchService.class);
        GoogleAPIService googleAPIService = context.getBean(GoogleAPIService.class);
        Environment env = context.getBean(Environment.class);
        LocalDate currentDate = new LocalDate();
        String currentMonthName = currentDate.toString("MMMM");
        String startDate = String.valueOf(currentDate.withDayOfMonth(1).toDateTimeAtStartOfDay().getMillis());
        String endDate = String.valueOf(currentDate.withDayOfMonth(currentDate.dayOfMonth().getMaximumValue()).
                toDateTimeAtStartOfDay().withHourOfDay(23).withMinuteOfHour(59).withSecondOfMinute(59).getMillis());
        String searchQueryKey = "esquery.collection.monthlycollection";
        String[] elasticIndexQuery = searchQueryKey.split(Pattern.quote("."));
        String noOfPaymentSpreadSheetID = env.getProperty("gsshid_cnp");
        String amountCollectedSpreadSheetID = env.getProperty("gsshid_cmc");
        String worksheetName = currentDate.toString("yyyy") + "-" + currentDate.plusYears(1).toString("yy");
        String searchQuery = env.getProperty(searchQueryKey);
        TaskScheduler scheduler = context.getBean(ThreadPoolTaskScheduler.class);
        scheduler.schedule(() -> {
            GoogleAPIService.getULBS().parallelStream().forEach(ulb -> {
                String ulbName = StringUtils.capitalize(ulb.toLowerCase());
                String query = searchQuery.replace("#CITYNAME#", ulbName).
                        replace("#FDATE#", startDate).replace("#TDATE#", endDate);
                LOG.debug("Start fetching data from elasticsearch index {} for city {}", elasticIndexQuery[1], ulbName);
                String result = elasticSearchService.search(elasticIndexQuery[1], query);
                LOG.debug("Finished fetching data from elasticsearch index {} for city {}", elasticIndexQuery[1], ulbName);
                JSONObject jsonResult = new JSONObject(result).getJSONObject("aggregations").getJSONObject("stats");

                try {
                    Double amtCollected = jsonResult.getDouble("sum");
                    Long count = jsonResult.getLong("count");
                    LOG.debug("Start uploading data to No of Payment \nworksheet {} in spreadsheet {} for city {} for the month of {}",
                            worksheetName, noOfPaymentSpreadSheetID, ulbName, currentMonthName);
                    googleAPIService.updateSheet(noOfPaymentSpreadSheetID, worksheetName, ulbName.toUpperCase(), count.doubleValue());
                    LOG.debug("Finished uploading data to  No of Payments\nworksheet {} in spreadsheet {}  for city {} for the month of {}",
                            worksheetName, noOfPaymentSpreadSheetID, ulbName, currentMonthName);
                    LOG.debug("Start uploading data to Total Collection\nworksheet {} in spreadsheet {} for city {} for the month of {}",
                            worksheetName, amountCollectedSpreadSheetID, ulbName, currentMonthName);
                    googleAPIService.updateSheet(amountCollectedSpreadSheetID, worksheetName, ulbName.toUpperCase(), amtCollected);
                    LOG.debug("Finished uploading data to Total Collection\nworksheet {} in spreadsheet {}  for city {} for the month of {}",
                            worksheetName, amountCollectedSpreadSheetID, ulbName, currentMonthName);
                } catch (Exception e) {
                    LOG.warn("Error occurred while while updating spreadsheet", e);
                }

            });
        }, new PeriodicTrigger(1, TimeUnit.HOURS));
    }
}
