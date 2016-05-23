package org.egov.service;

import org.egov.entity.AppNumberFormat;
import org.egov.repository.AppNumberFormatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.Expression;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.apache.commons.lang3.RandomStringUtils.randomAlphabetic;
import static org.apache.commons.lang3.RandomStringUtils.randomAlphanumeric;
import static org.apache.commons.lang3.RandomStringUtils.randomNumeric;
import static org.apache.commons.lang3.StringUtils.EMPTY;

@Service
public class AppNumberFormatService {

    private static final Pattern formatPattern = Pattern.compile("\\{(.*?)\\}");
    public static final String SEQ_FORMAT_PREFIX = "{seq(";
    public static final String FORMAT_SUFFIX = ")}";
    public static final String EXPL_FORMAT_PREFIX = "{expl(";
    public static final String RANDOM_FORMAT_PREFIX = "{rnd(";
    public static final String DATE_FORMAT_PREFIX = "{date(";

    @Autowired
    private AppNumberFormatRepository appNumberFormatRepository;

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public String generateApplicationNumber(String name, Object ... objects) {
        AppNumberFormat appNumberFormat = appNumberFormatRepository.findByName(name);
        String appNumber = appNumberFormat.getFormat();
        Matcher formatMatcher = formatPattern.matcher(appNumberFormat.getFormat());
        while(formatMatcher.find()) {
            String currentValue = formatMatcher.group();
            if(currentValue.contains(SEQ_FORMAT_PREFIX)) {
                String[] seq_exp = currentValue.replace(SEQ_FORMAT_PREFIX,EMPTY).replace(FORMAT_SUFFIX,EMPTY).trim().split(",");
                appNumber = appNumber.replace(currentValue, String.format("%0"+seq_exp[1]+"d",
                        (Serializable)entityManager.createNativeQuery("SELECT "+seq_exp[0]+".nextval from DUAL").getSingleResult()));
            } else if(currentValue.contains(EXPL_FORMAT_PREFIX)) {
                String [] expression = currentValue.replace(EXPL_FORMAT_PREFIX,EMPTY).replace(FORMAT_SUFFIX,EMPTY).trim().split(",");
                appNumber = appNumber.replace(currentValue, new SpelExpressionParser().parseExpression(expression[0])
                        .getValue(objects[Integer.valueOf(expression[1])]).toString());
            } else if (currentValue.contains(RANDOM_FORMAT_PREFIX)) {
                String [] random = currentValue.replace(RANDOM_FORMAT_PREFIX,EMPTY).replace(FORMAT_SUFFIX,EMPTY).trim().split(",");
                Integer size = Integer.valueOf(random[1]);
                appNumber = appNumber.replace(currentValue, random[0].equals("n") ? randomNumeric(size) :
                        random[0].equals("a") ? randomAlphabetic(size) : randomAlphanumeric(size));
            } else if(currentValue.contains(DATE_FORMAT_PREFIX)) {
                appNumber = appNumber.replace(currentValue, LocalDate.now().format(DateTimeFormatter
                        .ofPattern(currentValue.replace(DATE_FORMAT_PREFIX,EMPTY).replace(FORMAT_SUFFIX,EMPTY))));
            }
        }



        return appNumber;
    }


}
