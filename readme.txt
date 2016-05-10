How to use ___THEME_NAME___.jar:

1. Put ___THEME_NAME___.jar in WEB-INF/lib, then ___THEME_NAME___ will become your default theme if there is no others theme.

2. Now you can also dynamically switch between different themes by cookie or library property
	* Use library-property
	  	<!-- in WEB-INF/zk.xml -->
		<library-property>
		    <name>org.zkoss.theme.preferred</name>
		    <value>___THEME_NAME___</value>
		</library-property>
		
	* Use cookie to switch theme, add a cookie
		zktheme=___THEME_NAME___
	
It does not require a server restart, but user has to refresh the browser.
