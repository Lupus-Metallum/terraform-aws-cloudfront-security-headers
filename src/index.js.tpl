function handler(event) {
    var response = event.response;
    var headers = response.headers;

    // Set HTTP security headers
    // Since JavaScript doesnt allow for hyphens in variable names, we use the dict["key"] notation 
    //Set new headers 
    var addAccessControlAllowOrigin = ${add_access_control_allow_origin}
    if ( addAccessControlAllowOrigin ) {
        headers['access-control-allow-origin'] = { value: '${access_control_allow_origin_value}'}; 
    }
    var addAccessControlAllowMethods = ${add_access_control_allow_methods}
    if (addAccessControlAllowMethods) {
        headers['access-control-allow-methods'] = { value: '${access_control_allow_methods_value}'}; 
    }
    var addStrictTransportSecurity = ${add_strict_transport_security}
    if (addStrictTransportSecurity) {
        headers['strict-transport-security'] = { value: '${strict_transport_security_value}'}; 
    }
    var addContentSecurityPolicy = ${add_content_security_policy}
    if (addContentSecurityPolicy) {
        headers['content-security-policy'] = { value: "${content_security_policy_value}"}; 
    }
    var addXContentTypeOptions = ${add_x_content_type_options}
    if (addXContentTypeOptions) {
        headers['x-content-type-options'] = { value: '${x_content_type_options_value}'}; 
    }
    var addXFrameOptions = ${add_x_frame_options}
    if (addXFrameOptions) {
        headers['x-frame-options'] = { value: '${x_frame_options_value}'}; 
    }
    var addXXssProtection = ${add_x_xss_protection}
    if (addXXssProtection) {
        headers['x-xss-protection'] = { value: '${x_xss_protection_value}'}; 
    }
    var addReferrerPolicy = ${add_referrer_policy}
    if (addReferrerPolicy) {
        headers['referrer-policy'] = { value: '${referrer_policy_value}'}; 
    }
    var addFeaturePolicy = ${add_feature_policy}
    if (addFeaturePolicy) {
        headers['feature-policy'] = { value: '${feature_policy_value}'}; 
    }

    // Return the response to viewers 
    return response;
}
