package org.srpec.virat.timetablegenerator.general;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.PreparedStatement;

@Path("general")
public class GeneralController {

    @Context
    HttpServletRequest request;
    @Context
    HttpServletResponse response;

    @GET
    @Path("getBannerData")
    public Response getBannerData(@QueryParam("ispublished") String ispublished) {
        JSONArray jsonArray = new JSONArray();
        StringBuilder getBannerDataSQL = new StringBuilder();
        getBannerDataSQL.append(" SELECT ");
        getBannerDataSQL.append(" `id` , ");
        getBannerDataSQL.append(" `title`, ");
        getBannerDataSQL.append(" `description`, ");
        getBannerDataSQL.append(" `createdon` ");
        getBannerDataSQL.append(" FROM banner_master ");
        getBannerDataSQL.append(" WHERE delflag = 0 ");
        if ("1".equalsIgnoreCase(ispublished)) {
            getBannerDataSQL.append(" AND ispublished = 1 ");
        }
        try (DBConnection db = new DBConnection(true)) {
            jsonArray = db.getJsonFromDB(getBannerDataSQL, "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Utils.getResponse(jsonArray.toString(), Response.Status.OK);
    }

    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Path("deleteBanner")
    public Response deleteBanner(@FormParam("id") String id) {
        JSONObject jsonObject = new JSONObject();
        String SQL = "UPDATE banner_master SET delflag=1 WHERE id = ? LIMIT 1";
        try (DBConnection db = new DBConnection(false)) {
            PreparedStatement ps = db.prepareStatement(SQL, id);
            System.out.println();
            int wel = ps.executeUpdate();
            jsonObject.put("ok", wel >= 0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Utils.getResponse(jsonObject.toString(), Response.Status.OK);
    }
}