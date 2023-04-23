package org.srpec.virat.timetablegenerator.general;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

@Path("general")
public class GeneralController {
    @GET
    @Path("getData")
    public Response getData(){
        return Utils.getResponse("Hello World!",Response.Status.OK);
    }
}
