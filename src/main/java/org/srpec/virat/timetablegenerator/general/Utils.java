package org.srpec.virat.timetablegenerator.general;

import javax.ws.rs.core.Response;

public class Utils {
    public static Response getResponse(String response,Response.Status status){
        return Response
                .status(status)
                .entity(response)
                .build();
    }

    public static int safeInt(Object object,int safeValue){
        try {
            if (null != object && !"null".equalsIgnoreCase(object.toString()) && !"".equalsIgnoreCase(object.toString())){
                return Integer.parseInt(object.toString());
            } else {
                return safeValue;
            }
        } catch (NumberFormatException e) {
            return safeValue;
        }
    }
}
