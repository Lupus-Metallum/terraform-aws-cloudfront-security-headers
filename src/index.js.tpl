'use strict';
exports.handler = (event, context, callback) => {
    
    //Get contents of response
    const response = event.Records[0].cf.response;
    const headers = response.headers;

    //Set new headers 
    const addAccessControlAllowOrigin = ${add_access_control_allow_origin}
    if ( ${add_access_control_allow_origin} == true ) {
        headers['access-control-allow-origin'] = [{key: 'Access-Control-Allow-Origin', value: '${access_control_allow_origin_value}'}]; 
    }
    const addAccessControlAllowMethods = ${add_access_control_allow_methods}
    if (addAccessControlAllowMethods) {
        headers['access-control-allow-methods'] = [{key: 'Access-Control-Allow-Methods', value: '${access_control_allow_methods_value}'}]; 
    }
    const addStrictTransportSecurity = ${add_strict_transport_security}
    if (addStrictTransportSecurity) {
        headers['strict-transport-security'] = [{key: 'Strict-Transport-Security', value: '${strict_transport_security_value}'}]; 
    }
    const addContentSecurityPolicy = ${add_content_security_policy}
    if (addContentSecurityPolicy) {
        headers['content-security-policy'] = [{key: 'Content-Security-Policy', value: "${content_security_policy_value}"}]; 
    }
    const addXContentTypeOptions = ${add_x_content_type_options}
    if (addXContentTypeOptions) {
        headers['x-content-type-options'] = [{key: 'X-Content-Type-Options', value: '${x_content_type_options_value}'}]; 
    }
    const addXFrameOptions = ${add_x_frame_options}
    if (addXFrameOptions) {
        headers['x-frame-options'] = [{key: 'X-Frame-Options', value: '${x_frame_options_value}'}]; 
    }
    const addXXssProtection = ${add_x_xss_protection}
    if (addXXssProtection) {
        headers['x-xss-protection'] = [{key: 'X-XSS-Protection', value: '${x_xss_protection_value}'}]; 
    }
    const addReferrerPolicy = ${add_referrer_policy}
    if (addReferrerPolicy) {
        headers['referrer-policy'] = [{key: 'Referrer-Policy', value: '${referrer_policy_value}'}]; 
    }

    //Return modified response
    callback(null, response);
};