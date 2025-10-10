package org.digit.tracking.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.NativeWebRequest;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TrackingApiUtil {

    static Logger logger = LoggerFactory.getLogger(TrackingApiUtil.class);

    public static void setResponse(NativeWebRequest req, String jsonData) {
        logger.info("## setResponse is creating the response message");
        String contentType = "application/json";
        try {
            HttpServletResponse res = req.getNativeResponse(HttpServletResponse.class);
            res.setCharacterEncoding("UTF-8");
            res.addHeader("Content-Type", contentType);
            res.getWriter().print(jsonData);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
