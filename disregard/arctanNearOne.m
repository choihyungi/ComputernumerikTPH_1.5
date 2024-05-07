function arctan = arctanNearOne(delta)
    arctan = pi/2;
    arctan = arctan + delta/2;
    arctan = arctan - delta^2/4;
    arctan = arctan + delta^3/12;
    arctan = arctan - delta^5/40;
    arctan = arctan + delta^6/48;
    arctan = arctan - delta^7/112;
    arctan = arctan + delta^9/288;
    arctan = arctan - delta^10/320;
    arctan = arctan + delta^11/704;
    
end