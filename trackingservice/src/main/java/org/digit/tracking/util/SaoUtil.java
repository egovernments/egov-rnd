package org.digit.tracking.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

import java.util.HashMap;
import java.util.Map;

public class SaoUtil {
    static Logger logger = LoggerFactory.getLogger(SaoUtil.class);

    public static HttpEntity<Map<String, Object>> getMapHttpEntity(String authToken, Map<String, Object> additionalData) {
        logger.info("## Invoked getMapHttpEntity ");
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        Map<String, Object> mapInner = new HashMap<>();
        mapInner.put("apiId", "Rainmaker");
        if (authToken != null)
            mapInner.put("authToken", authToken);
        mapInner.put("msgId", "1694796531963|en_IN");

        Map<String, Object> mapOuter = new HashMap<>();
        mapOuter.put("RequestInfo", mapInner);
        //In case additional data payload map is provided, add it to the request body
        if(additionalData != null){
            mapOuter.putAll(additionalData);
        }

        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(mapOuter, headers);
        return entity;
    }

}
