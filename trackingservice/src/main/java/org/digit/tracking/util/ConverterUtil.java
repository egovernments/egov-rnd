package org.digit.tracking.util;

import org.openapitools.model.Address;

public class ConverterUtil {

    private static final String DELIIMITER = ", ";

    //Convert address entity to a shortened and single line address text
    public static String addressToString(Address address) {
        if (address == null) return "";
        StringBuilder addressStringBuilder = new StringBuilder();
        addressStringBuilder
                .append(ifFieldNotNull(address.getAddressTitle()))
                .append(ifFieldNotNull(address.getDoorNo()))
                .append(ifFieldNotNull(address.getPlotNo()))
                .append(ifFieldNotNull(address.getLandmark()))
                .append(ifFieldNotNull(address.getCity()))
                .append(ifFieldNotNull(address.getDistrict()))
                .append(ifFieldNotNull(address.getState()))
                .append(ifFieldNotNull(address.getPincode()));
        String returnString = addressStringBuilder.toString();
        returnString = returnString.endsWith(DELIIMITER)? returnString.substring(0, returnString.length()-DELIIMITER.length()) : returnString;

        return returnString;
    }

    private static String ifFieldNotNull(String input){
        if (input == null || input.isEmpty() || input.equals("null")) {
            return "";
        } else {
            return input.concat(DELIIMITER);
        }
    }
}
