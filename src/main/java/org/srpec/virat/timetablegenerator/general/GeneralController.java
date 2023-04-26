package org.srpec.virat.timetablegenerator.general;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

@Path("general")
public class GeneralController {
    @GET
    @Path("getData")
    public Response getData(){
        JSONArray jso = new JSONArray();
        return Utils.getResponse(jso.toString(),Response.Status.OK);
    }

    @GET
    @Path("getBannerData")
    public Response getBannerData(@QueryParam("ispublished") String ispublished){
        JSONArray jsonArray = new JSONArray();
        StringBuilder getBannerDataSQL = new StringBuilder();
        getBannerDataSQL.append(" SELECT ");
        getBannerDataSQL.append(" `id` , ");
        getBannerDataSQL.append(" `title`, ");
        getBannerDataSQL.append(" `description`, ");
        getBannerDataSQL.append(" `createdon` ");
        getBannerDataSQL.append(" FROM banner_master ");
        getBannerDataSQL.append(" WHERE delflag = 0 ");
        if ("1".equalsIgnoreCase(ispublished)){
            getBannerDataSQL.append(" AND ispublished = 1 ");
        }
        try(DBConnection db = new DBConnection(true)) {
            jsonArray = db.getJsonFromDB(getBannerDataSQL,"");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Utils.getResponse(jsonArray.toString(),Response.Status.OK);
    }
}