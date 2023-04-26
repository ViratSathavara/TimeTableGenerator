package org.srpec.virat.timetablegenerator.general;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

@Path("general")
public class GeneralController {
    @GET
    @Path("getData")
    public Response getData(){
        JSONArray jso = new JSONArray();
        try (DBConnection ds = new DBConnection(true)){
            String SQL  = " SELECT * FROM SLOTS WHERE CLASS = ? ";

        } catch (Exception e) {
            e.printStackTrace();
        }

        for (int i = 0; i < 10; i++) {
            JSONObject data = new JSONObject();
            data.put("id","my_id_"+i);
            data.put("name","my_Name_"+i);
            data.put("age","my_age_"+i);
            data.put("EnrollmentNo","my_Enrollment_"+i);
            jso.put(data);
        }
        return Utils.getResponse(jso.toString(),Response.Status.OK);
    }
}
