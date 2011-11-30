package org.iotashan.utils {
	
	import org.iotashan.oauth.OAuthToken;
	
	/**
	 * Helper class for typical OAuth tasks
	 */
	public class OAuthUtil {
		
		/**
		 *
		 * @param tokenResponse Result from a getRequest/AccessToken call.
		 * @return OAuthToken containing key/secret of the token request response.
		 *
		 * Inspired by http://github.com/sekimura/as3-misc/blob/master/twitter-oauth/test2.mxml
		 *
		 */
		public static function getTokenFromResponse( tokenResponse : String ) : OAuthToken {
			var result:OAuthToken = new OAuthToken();
			
			var params:Array = tokenResponse.split( "&" );
			for each ( var param : String in params ) {
				var paramNameValue:Array = param.split( "=" );
				if ( paramNameValue.length == 2 ) {
					if ( paramNameValue[0] == "oauth_token" ) {
						result.key = paramNameValue[1];
					} else if ( paramNameValue[0] == "oauth_token_secret" ) {
						result.secret = paramNameValue[1];
					}
				}
			}
			
			// check if key and secret are set otherwise return null
			if ( result.key != null && result.secret != null ) {
				return result;
			}
			return null;
		}
	}
}