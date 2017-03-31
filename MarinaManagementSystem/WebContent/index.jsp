<%@ page language="java" contentType="text/html; charset=ISO-8859-9" import="java.io.*, java.util.*, java.util.Date, java.sql.*, javax.servlet.*, java.text.* "
	pageEncoding="ISO-8859-9"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en"> <!--<![endif]-->
<head>
<jsp:include page="header.jsp" />

<title>Home - Environment Tracking Software</title>

<script>

function OpenNewWindow(bigurl, width, height)
{
    var newWindow = window.open("", "pictureViewer", 
        "location=no, directories=no, fullscreen=no, " + 
        "menubar=no, status=no, toolbar=no, width=" + 
        width + ", height=" + height + ", scrollbars=no");
    newWindow.document.writeln("<html>");
    newWindow.document.writeln("<body style='margin: 0 0 0 0;'>");
    newWindow.document.writeln("<a href='javascript:window.close();'>");
    newWindow.document.writeln("<img src='" + bigurl + 
       "' alt='Click to close' id='bigImage'/>");
    newWindow.document.writeln("</a>");
    newWindow.document.writeln("</body></html>");
    newWindow.document.close();
}

</script>

</head>

<%
	String userName;
	if(session.getAttribute( "userName") == null || session.getAttribute( "password") == null)
	{
		response.sendRedirect("login.jsp");
		return;
	}
	else
	{
		userName = session.getAttribute("userName").toString();
	}
	

	// If the viewing device is not mobile, then fit the content to any screen
	if(session.getAttribute("isMobile").toString().equalsIgnoreCase("false"))
	{
  		%>
			<!-- START OF Div's to make the footer fixed at bottom and page content fixed vertically on any screen -->
			<div id="container" style="display: table; height: 100%; width: 100%; #position: relative; overflow: hidden;">
			<div id="body" style="#position: absolute; #top: 50%;display: table-cell; vertical-align: middle;">
			<!-- END OF Div's -->
		<%
	}
%>

<body class="withAnimation">

<!-- FOR MOBILE DEVICES -->

<!-- left navbar -->
<div class="snap-drawers-button">
    <button type="button" class="navbar-toggle">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
</div>
<div class="snap-drawers">
    <div class="snap-drawer snap-drawer-left">
        <div>
            <div class="navbar-collapse collapse">
	            <ul class="nav navbar-nav navbar-right">
	                <li class="active">
	                    <a href="index.jsp">Home</a>
	                </li>
	                <li>
	                    <a href="aboutUs.jsp">About</a>
	                </li>
	                <li>
	                    <a href="#">Reports</a>
	                    <ul class="list-unstyled" role="menu">
	                        <li><a href="queryDatabase.jsp">Query&emsp;<span>Query the database</span></a></li>
	                        <li><a href="plotGraph.jsp">Graph&emsp;<span>Plot graph</span></a></li>
	                    </ul>
	                </li>
	                <li>
	                    <a href="#">Settings</a>
	                    <ul class="list-unstyled" role="menu">
	                        <li><a href="userSettings.jsp">User Settings&emsp;<span>Update your profile</span></a></li>
	                        <li><a href="serverSettings.jsp">Server Settings&nbsp;<span>Change mote settings</span></a></li>
	                        <%
	                        	// If the browsing user is administrator, then show the related menu item
	                        	if(session.getAttribute("role").toString().equalsIgnoreCase("1") || session.getAttribute("role").toString().equalsIgnoreCase("3") || session.getAttribute("role").toString().equalsIgnoreCase("4"))
	                        	{
	                        		%>
	                        		<li><a href="systemUsers.jsp">System Users&nbsp;<span>Edit system users</span></a></li>
	                        		<%
	                        	}
	                        %>
	                    </ul>
	                </li>
	
	            </ul>
	            <a class="btn btn-border active" style="border-color: #FF9A00; background: #FF9A00; font-size: 14px; font-weight: normal;" href="contactUs.jsp">Contact us!</a>
	            <a class="btn btn-border active" style="border-color: #DF2D1C; background: #DF2D1C; font-size: 14px; font-weight: normal;" href="#" onclick="return askForLogout();">Logout</a>
            </div>
        </div>
    </div>
</div>
<!-- / left navbar -->

<!-- / FOR MOBILE DEVICES -->
<%String gelenRole = session.getAttribute("role").toString(); %>
<!-- snap content -->
<div id="boxedWrapper" class="snap-content">

<nav class="navbar navbar-default navbar-transparent navbar-fixed-top" style="background-color: black;" role="navigation">
    <div class="container" style="position: relative; z-index: 100;">
        <div class="navbar-header">
            <button type="button" id="navbar-toggle" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp" data-logo="images/ETS-Logo.png"><img src="images/ETS-Logo.png" alt="" title=""></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right" style="position: relative; z-index: 100;">
                <li class="active dropdown">
                    <a href="index.jsp" class="dropdown-toggle" data-toggle="dropdown">Home</a>
                </li>
                <li class="dropdown">
                    <a href="aboutUs.jsp" class="dropdown-toggle" data-toggle="dropdown">About</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Reports</a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="queryDatabase.jsp">Query<span>Query the database</span></a></li>
                        <li><a href="plotGraph.jsp">Graph<span>Plot a graph</span></a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Settings</a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="userSettings.jsp">User Settings<span>Update your profile</span></a></li>
                        <li><a href="serverSettings.jsp">Server Settings<span>Change mote settings</span></a></li>
                        <%
                        	// If the browsing user is administrator, then show the related menu item
                        	if(session.getAttribute("role").toString().equalsIgnoreCase("1") || session.getAttribute("role").toString().equalsIgnoreCase("3") || session.getAttribute("role").toString().equalsIgnoreCase("4"))
                        	{
                        		%>
                        		<li><a href="systemUsers.jsp">System Users<span>Edit system users</span></a></li>
                        		<%
                        	}
                        %>
                    </ul>
                </li>
                <li><a class="btn btn-border" style="border-color: #FF9A00; background: #FF9A00; font-size: 14px; font-weight: normal;" href="contactUs.jsp">Contact us!</a></li>
                <li><a class="btn btn-border" style="border-color: #DF2D1C; background: #DF2D1C; font-size: 14px; font-weight: normal;" href="#" onclick="return askForLogout();">Logout</a></li>
                <br/>
                <div align="right">Welcome, <a href="userSettings.jsp"><% out.print(userName+"."); %></a></div>
                <br/>
            </ul>
        </div>
    </div>
</nav>
<!-- / navbar -->





<!-- header -->
<header class="height">

<!-- ANY HEADER CONTENT HERE -->

</header>
<!-- / header -->

<!-- Import all java classes from the package -->
		
<%@ page import="com.environmenttrackingsoftware.conf.* " %>

<%!

	public static void sortAccordingToMoteID(LatestMoteInfo [] arrayToBeSorted, int arraySize)
	{
		
		for(int i=0; i < arraySize; i++)
		{
			LatestMoteInfo tempMoteInfoObject = new LatestMoteInfo();
			
			int tempMoteID = arrayToBeSorted[i].getMoteID();
			tempMoteInfoObject = arrayToBeSorted[i];
			
			int j;
			
			for(j=i-1; j >= 0 && tempMoteID < arrayToBeSorted[j].getMoteID(); j--)
			{
				arrayToBeSorted[j+1] = arrayToBeSorted[j];
			}
			
			arrayToBeSorted[j+1] = tempMoteInfoObject;
			
		}
		
	}

%>

<%
	// Create a database object
	DatabaseSettings dbSettings = new DatabaseSettings();
	
	// Connect to the database
	Class.forName(dbSettings.getClassForName());
	Connection connection = DriverManager.getConnection(dbSettings.getDBName(), dbSettings.getDBUserName(), dbSettings.getDBPass());

	Statement statementForMoteInformation = connection
			.createStatement();
	
	Statement statementForPresenceReport = connection
			.createStatement();
	
	Statement statementForNumberOfMotes = connection
			.createStatement();
	
	Statement statementForNumberOfProblematicMotes = connection
			.createStatement();
	
	Statement statementForHumidityAndTemperature = connection.createStatement();
	
	/*
	ResultSet resultSetForLatestWarningReports = connection
			.createStatement().executeQuery("SELECT * FROM MOTE_INFORMATION WHERE INFO_DATE >= curdate() - INTERVAL DAYOFWEEK(curdate())+6 DAY AND INFO_DATE < curdate() - INTERVAL DAYOFWEEK(curdate())-1 DAY;");
	*/

	/*
	ResultSet resultSetForMoteInformation = statementForMoteInformation
			.executeQuery("SELECT * FROM mts.mode_information WHERE info_date > SYSDATE - 1 ORDER BY info_date DESC");
	 
	ResultSet resultSetForMoteInformation = statementForMoteInformation
			.executeQuery("SELECT * FROM MTS.MOTE_INFORMATION WHERE ROWNUM <= 7 ORDER BY info_date DESC");
	*/
	ResultSet resultSetForMoteInformation = statementForMoteInformation
	.executeQuery("SELECT * FROM (SELECT DATE_FORMAT(INFO_DATE, '%d.%m.%Y') AS DATE_FORMATTED, INFO_TIME, MOTE_ID, PRESENCE, TEMPERATURE, HUMIDITY, BATTERY_LEVEL FROM MOTE_INFORMATION ORDER BY INFO_DATE DESC, INFO_TIME DESC LIMIT 7) AS DATE");
	
	ResultSet resultSetForPresenceReport = statementForPresenceReport
	.executeQuery("SELECT MOTE_ID FROM (SELECT * FROM MOTE_INFORMATION WHERE (INFO_DATE = CURDATE() - INTERVAL 1 DAY AND INFO_TIME <= CAST('23:59:59' AS time) AND INFO_TIME >= CURTIME()) OR (INFO_DATE = CURDATE() AND INFO_TIME >= CAST('00:00:00' AS time) AND INFO_TIME <= CURTIME())) AS PRESENCE_COND WHERE PRESENCE = \"OFF\"");
	
	ResultSet resultSetForNumberOfMotes = statementForNumberOfMotes
	.executeQuery("SELECT COUNT(*) AS TOTAL_NO_OF_MOTES FROM (SELECT DISTINCT MOTE_ID FROM (SELECT * FROM MOTE_INFORMATION WHERE (INFO_DATE = CURDATE()-1 AND INFO_TIME <= '23:59:59' AND INFO_TIME >= CURTIME()) OR (INFO_DATE = CURDATE() AND INFO_TIME >= '00:00:00' AND INFO_TIME <= CURTIME())) AS ACTIVE_MOTES) AS NO_OF_MOTES");
	
	ResultSet resultSetForNumberOfProblematicMotes = statementForNumberOfProblematicMotes
	.executeQuery("SELECT COUNT(*) AS NO_OF_NON_PROBLEMATIC_MOTES FROM (SELECT DISTINCT MOTE_ID FROM (SELECT * FROM MOTE_INFORMATION WHERE (INFO_DATE = CURDATE()-1 AND INFO_TIME <= \"23:59:59\" AND INFO_TIME >= CURTIME()) OR (INFO_DATE = CURDATE() AND INFO_TIME >= \"00:00:00\" AND INFO_TIME <= CURTIME())) AS PRESENCE_COND WHERE PRESENCE = \"OFF\") AS NON_PROBLEMATIC_MOTES");
	
	ResultSet resultSetForHumidityAndTemperature = statementForHumidityAndTemperature
	.executeQuery("SELECT * FROM MOTE_INFORMATION WHERE (INFO_DATE = CURDATE() - INTERVAL 1 DAY AND INFO_TIME <= CAST('23:59:59' AS time) AND INFO_TIME >= CURTIME()) OR (INFO_DATE = CURDATE() AND INFO_TIME >= CAST('00:00:00' AS time) AND INFO_TIME <= CURTIME()) ORDER BY INFO_DATE DESC, INFO_TIME DESC");
	
	ResultSet resultSetForSettings = connection.createStatement().executeQuery("SELECT * FROM SETTINGS WHERE ID=1");
	
	ResultSet resultSetForMoteLocations = connection.createStatement().executeQuery("SELECT * FROM MOTES ORDER BY MOTE_ID");
	
	String stringVersionOfNumberOfMotes = null, stringVersionOfNumberOfNonProblematicMotes = null;
	
	if(resultSetForNumberOfMotes.next())
	{
		stringVersionOfNumberOfMotes = resultSetForNumberOfMotes.getString("TOTAL_NO_OF_MOTES");
	}
	
	if(resultSetForNumberOfProblematicMotes.next())
	{
		stringVersionOfNumberOfNonProblematicMotes = resultSetForNumberOfProblematicMotes.getString("NO_OF_NON_PROBLEMATIC_MOTES");
	}
	
	//out.println("NUMBER OF MOTES: "+stringVersionOfNumberOfMotes+"\nNUMBER OF NON PROBLEMATIC MOTES: "+stringVersionOfNumberOfNonProblematicMotes);
	
	int numberOfMotes = Integer.parseInt(stringVersionOfNumberOfMotes);
	int numberOfNonProblematicMotes = Integer.parseInt(stringVersionOfNumberOfNonProblematicMotes);
	
	ArrayList<String> moteLocations = new ArrayList<String>();
	
	while(resultSetForMoteLocations.next())
	{
		// moteLocations[0] is always pointing to base station, so start from 1 while using
		moteLocations.add(resultSetForMoteLocations.getString("MOTE_LOCATION"));
	}
	
	ArrayList<String> arrayListForLatestMoteInfo = new ArrayList<String>();
	ArrayList<String> listOfNonProblematicMotes = new ArrayList<String>();
	ArrayList<String> listOfTempAndHumidValues = new ArrayList<String>();
	
	SimpleDateFormat hourFormat = new SimpleDateFormat("dd:MM:yyyy:hh:mm:a");
	Date dNow = new Date();
	//SimpleDateFormat currentWantedTimeFormat = new SimpleDateFormat("hh:mm");
	String currentTime = hourFormat.format(dNow).toString();
	//String currentWantedTime = currentWantedTimeFormat.format(dNow).toString();
	String[] parts = currentTime.split(":");
	String stringVersionOfDay = parts[0];
	String stringVersionOfMonth = parts[1];
	String stringVersionOfYear = parts[2];
	
	String stringVersionOfHour = parts[3];
	String stringVersionOfMinutes = parts[4];
	String amORpm = parts[5];
	int currentYear = Integer.parseInt(stringVersionOfYear);
	int currentMonth = Integer.parseInt(stringVersionOfMonth);
	int currentDay = Integer.parseInt(stringVersionOfDay);
	int currentHour = Integer.parseInt(stringVersionOfHour);
	int currentMinutes = Integer.parseInt(stringVersionOfMinutes);
	int previousDay = currentDay-1;
	int previousMonth = currentMonth;
	int previousYear = currentYear;
	
	
	// Get the last date of the month
	Calendar calendarForPreviousMonth = Calendar.getInstance();
	// add -1 month to current month
	calendarForPreviousMonth.add(Calendar.MONTH, -1);
	// set DATE to 1, so first date of previous month
	calendarForPreviousMonth.set(Calendar.DATE, 1);

	//Date firstDateOfPreviousMonth = calendarForPreviousMonth.getTime();

	// set actual maximum date of previous month
	calendarForPreviousMonth.set(Calendar.DATE, calendarForPreviousMonth.getActualMaximum(Calendar.DAY_OF_MONTH));
	//read it
	Date dateOfPreviousMonth = calendarForPreviousMonth.getTime();
	
	String dateOfLastMonth = new SimpleDateFormat("dd.MM.yyyy").format(dateOfPreviousMonth);
	
	if(previousDay == 0)
	{
		String partsOfDateOfLastMonth[] = dateOfLastMonth.split("\\.");
		previousDay = Integer.parseInt(partsOfDateOfLastMonth[0]);
		previousMonth = Integer.parseInt(partsOfDateOfLastMonth[1]);
		
		// If last month's year is currentYear-1
		if(Integer.parseInt(partsOfDateOfLastMonth[2]) == currentYear-1)
		{
			previousYear = Integer.parseInt(partsOfDateOfLastMonth[2]);
		}
	}
	
	DecimalFormat decimalFormatter = new DecimalFormat("00");
	
    while(resultSetForPresenceReport.next())
    {
    	listOfNonProblematicMotes.add(resultSetForPresenceReport.getString("MOTE_ID"));
    }
    
    /*
    for(int i=0; i<listOfNonProblematicMotes.size(); i++)
    {
    	out.println("NON PROB MOTE: "+listOfNonProblematicMotes.get(i));
    }
    */
    
    while(resultSetForHumidityAndTemperature.next())
    {
    	listOfTempAndHumidValues.add(resultSetForHumidityAndTemperature.getString("MOTE_ID"));
    	listOfTempAndHumidValues.add(resultSetForHumidityAndTemperature.getString("INFO_DATE"));
    	listOfTempAndHumidValues.add(resultSetForHumidityAndTemperature.getString("INFO_TIME"));
    	listOfTempAndHumidValues.add(resultSetForHumidityAndTemperature.getString("TEMPERATURE"));
    	listOfTempAndHumidValues.add(resultSetForHumidityAndTemperature.getString("HUMIDITY"));
    	listOfTempAndHumidValues.add(resultSetForHumidityAndTemperature.getString("BATTERY_LEVEL"));
    }
    
    /*
    for(int i=0; i<listOfTempAndHumidValues.size(); i=i+5)
    {
    	out.println("MOTE ID: "+listOfTempAndHumidValues.get(i));
    	out.println("DATE: "+listOfTempAndHumidValues.get(i+1));
    	out.println("TIME: "+listOfTempAndHumidValues.get(i+2));
    	out.println("TEMP: "+listOfTempAndHumidValues.get(i+3));
    	out.println("HUMID: "+listOfTempAndHumidValues.get(i+4));
    }
    */
    
    int checkConditionCounter = 0, moteIDForTempAndHumidValues, moteIsAlreadyReported;
    
    
	
	if(numberOfMotes - numberOfNonProblematicMotes > 0)
	{
		
		// If all motes are problematic, meaning all of the lights have been ON for 24 hours, act accordingly.
		if(numberOfMotes - numberOfNonProblematicMotes == numberOfMotes)
		{
			for(int i=1; i<=numberOfMotes; i++)
			{
				moteIsAlreadyReported = 0;
				moteIDForTempAndHumidValues = (i-1)*6;
				
				for(int k=0; k<arrayListForLatestMoteInfo.size(); k=k+4)
				{
					/*
					out.println("\n\tTrying... ");
					out.println("\n\tLatest Mote Info MOTE ID: "+arrayListForLatestMoteInfo.get(k));
					out.println("\n\tTemp Humid MOTE ID: "+listOfTempAndHumidValues.get(moteIDForTempAndHumidValues));
					*/
					
					if(Integer.parseInt(arrayListForLatestMoteInfo.get(k)) == Integer.parseInt(listOfTempAndHumidValues.get(moteIDForTempAndHumidValues)))
					{
						moteIsAlreadyReported = 1;
					}
				}
				
				if(moteIsAlreadyReported == 0)
				{
					//out.println("MOTE ID FOR NOW: "+listOfTempAndHumidValues.get(moteIDForTempAndHumidValues));
					arrayListForLatestMoteInfo.add(listOfTempAndHumidValues.get(moteIDForTempAndHumidValues));
					arrayListForLatestMoteInfo.add(decimalFormatter.format(previousDay)+"."+decimalFormatter.format(previousMonth)+"."+decimalFormatter.format(previousYear)+" - "+decimalFormatter.format(currentDay)+"."+decimalFormatter.format(currentMonth)+"."+currentYear);
					arrayListForLatestMoteInfo.add(currentHour+":"+decimalFormatter.format(currentMinutes)+" "+amORpm);
					//arrayListForLatestMoteInfo.add("The light has been <font color=red>ON</font> for 24 hours in the location of mote "+listOfTempAndHumidValues.get(moteIDForTempAndHumidValues)+"!");
					arrayListForLatestMoteInfo.add("The light has been <font color=red>ON</font> for 24 hours in "+moteLocations.get(Integer.parseInt(listOfTempAndHumidValues.get(moteIDForTempAndHumidValues)))+"!");
				}
				
			}
		}
		// If not all the motes are problematic, meaning some of the lights; not all, have been ON for 24 hours, act accordingly.
		else
		{
			for(int i=1; i<=numberOfMotes; i++)
			{
				//out.println("CURRENT MOTE ID: "+i);
				moteIDForTempAndHumidValues = (i-1)*6;
				
				for(int j=0; j<listOfNonProblematicMotes.size(); j++)
				{
					// if listOfNonProblematicMotes.moteID != currentMoteID
					if(Integer.parseInt(listOfNonProblematicMotes.get(j)) != Integer.parseInt(listOfTempAndHumidValues.get(moteIDForTempAndHumidValues)))
					{
						checkConditionCounter++;
					}
				}
				
				moteIsAlreadyReported = 0;
				
				for(int k=0; k<arrayListForLatestMoteInfo.size(); k=k+4)
				{
					/*
					out.println("\n\tTrying... ");
					out.println("\n\tLatest Mote Info MOTE ID: "+arrayListForLatestMoteInfo.get(k));
					out.println("\n\tTemp Humid MOTE ID: "+listOfTempAndHumidValues.get(moteIDForTempAndHumidValues));
					*/
					
					if(Integer.parseInt(arrayListForLatestMoteInfo.get(k)) == Integer.parseInt(listOfTempAndHumidValues.get(moteIDForTempAndHumidValues)))
					{
						moteIsAlreadyReported = 1;
					}
				}
				
				if((checkConditionCounter == listOfNonProblematicMotes.size()) && (moteIsAlreadyReported == 0))
				{
					//out.println("Light is on for mote ID: "+listOfTempAndHumidValues.get(moteIDForTempAndHumidValues));
					arrayListForLatestMoteInfo.add(listOfTempAndHumidValues.get(moteIDForTempAndHumidValues));
					arrayListForLatestMoteInfo.add(decimalFormatter.format(previousDay)+"."+decimalFormatter.format(previousMonth)+"."+decimalFormatter.format(previousYear)+" - "+decimalFormatter.format(currentDay)+"."+decimalFormatter.format(currentMonth)+"."+currentYear);
					arrayListForLatestMoteInfo.add(currentHour+":"+decimalFormatter.format(currentMinutes)+" "+amORpm);
					//arrayListForLatestMoteInfo.add("The light has been <font color=red>ON</font> for 24 hours in the location of mote "+listOfTempAndHumidValues.get(moteIDForTempAndHumidValues)+"!");
					arrayListForLatestMoteInfo.add("The light has been <font color=red>ON</font> for 24 hours in "+moteLocations.get(Integer.parseInt(listOfTempAndHumidValues.get(moteIDForTempAndHumidValues)))+"!");
				}
				checkConditionCounter = 0;
			}
		}
	}
    
    // Create a class for the latest temperature and humid values of the motes
    // Create an array for the objects of that class (ActiveMotes [] array = new ActiveMotes [numberOfMotes])
    LatestMoteInfo [] latestMoteInfoArray = new LatestMoteInfo [listOfTempAndHumidValues.size()];
    		
   	int tempCounter = 0;
    
    for (int i=0; i<listOfTempAndHumidValues.size(); i=i+6)
    {
    	// Create an object for each active mote here (ActiveMotes tempMote = new ActiveMotes())
    	LatestMoteInfo tempMote = new LatestMoteInfo();
    			
    	// Save that object in an array (array[tempMoteID] = tempMote)
    	latestMoteInfoArray[tempCounter] = tempMote;
		
    	if (tempCounter > 0)
    	{
    		int swapMayBeHappened = 0;

    		for(int j=0; j<tempCounter; j++)
    		{
    			
    			if(latestMoteInfoArray[j].getMoteID() == Integer.parseInt(listOfTempAndHumidValues.get(i)))
    			{
    				swapMayBeHappened = 1;
	      			// Convert last verified mote info time and date into a comparable format
	      			// Convert the trial mote info time and date into a comparable format
	      			DateFormat dateFormatter, timeFormatter;
	      			Date latestMoteInfoDate, trialInfoDate, latestMoteInfoTime, trialInfoTime;
	      			  
	      			dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
	      			latestMoteInfoDate = dateFormatter.parse(latestMoteInfoArray[j].getInfoDate());
	      			trialInfoDate = dateFormatter.parse(listOfTempAndHumidValues.get(i+1));
	      			  
	      			timeFormatter = new SimpleDateFormat("H:m:s");
	      			latestMoteInfoTime = timeFormatter.parse(latestMoteInfoArray[j].getInfoTime());
	      			trialInfoTime = timeFormatter.parse(listOfTempAndHumidValues.get(i+2));
	      			  
	    			if (trialInfoDate.after(latestMoteInfoDate))
	    			{
	    				//out.println("TRIAL DATE IS GREATER THAN MOTE INFO DATE!");
	    				latestMoteInfoArray[j].setMoteID(Integer.parseInt(listOfTempAndHumidValues.get(i)));
	    				latestMoteInfoArray[j].setInfoDate(listOfTempAndHumidValues.get(i+1));
	    				latestMoteInfoArray[j].setInfoTime(listOfTempAndHumidValues.get(i+2));
	    				latestMoteInfoArray[j].setTemp(listOfTempAndHumidValues.get(i+3));
	    				latestMoteInfoArray[j].setHumid(listOfTempAndHumidValues.get(i+4));
	    				latestMoteInfoArray[j].setBatteryLevel(listOfTempAndHumidValues.get(i+5));
	    				tempCounter--;
	    			}
	    			else if (trialInfoDate.equals(latestMoteInfoDate) && trialInfoTime.after(latestMoteInfoTime))
	    			{
	    				//out.println("TRIAL DATE AND TIME IS GREATER THAN MOTE INFO DATE!");
	    				latestMoteInfoArray[j].setMoteID(Integer.parseInt(listOfTempAndHumidValues.get(i)));
	    				latestMoteInfoArray[j].setInfoDate(listOfTempAndHumidValues.get(i+1));
	    				latestMoteInfoArray[j].setInfoTime(listOfTempAndHumidValues.get(i+2));
	    				latestMoteInfoArray[j].setTemp(listOfTempAndHumidValues.get(i+3));
	    				latestMoteInfoArray[j].setHumid(listOfTempAndHumidValues.get(i+4));
	    				latestMoteInfoArray[j].setBatteryLevel(listOfTempAndHumidValues.get(i+5));
	    				tempCounter--;
	    			}
	    			else
	    			{
	    				tempCounter--;
	    				continue;
	    			}
    			}
    		}
			if(swapMayBeHappened == 0)
 			{
				latestMoteInfoArray[tempCounter].setMoteID(Integer.parseInt(listOfTempAndHumidValues.get(i)));
 				//out.println("MOTE ID: "+latestMoteInfoArray[tempMoteID].getMoteID());
 				latestMoteInfoArray[tempCounter].setInfoDate(listOfTempAndHumidValues.get(i+1));
 				latestMoteInfoArray[tempCounter].setInfoTime(listOfTempAndHumidValues.get(i+2));
 				latestMoteInfoArray[tempCounter].setTemp(listOfTempAndHumidValues.get(i+3));
 				latestMoteInfoArray[tempCounter].setHumid(listOfTempAndHumidValues.get(i+4));
 				latestMoteInfoArray[tempCounter].setBatteryLevel(listOfTempAndHumidValues.get(i+5));
 			 }
    	}
    	else
    	{
    		latestMoteInfoArray[tempCounter].setMoteID(Integer.parseInt(listOfTempAndHumidValues.get(i)));
			//out.println("MOTE ID: "+latestMoteInfoArray[tempMoteID].getMoteID());
			latestMoteInfoArray[tempCounter].setInfoDate(listOfTempAndHumidValues.get(i+1));
			latestMoteInfoArray[tempCounter].setInfoTime(listOfTempAndHumidValues.get(i+2));
			latestMoteInfoArray[tempCounter].setTemp(listOfTempAndHumidValues.get(i+3));
			latestMoteInfoArray[tempCounter].setHumid(listOfTempAndHumidValues.get(i+4));
			latestMoteInfoArray[tempCounter].setBatteryLevel(listOfTempAndHumidValues.get(i+5));
    	}
    	tempCounter++;
    }
    
    int temperatureUpLimit = 30;
    int temperatureDownLimit = 22;
    int humidityUpLimit = 50;
    int humidityDownLimit = 30;
    int batteryLevelDownLimit = 50;
    
    if(resultSetForSettings.next())
    {
    	temperatureDownLimit = resultSetForSettings.getInt("TEMP_DOWN_LIMIT");
    	temperatureUpLimit = resultSetForSettings.getInt("TEMP_UP_LIMIT");
    	humidityDownLimit = resultSetForSettings.getInt("HUMID_DOWN_LIMIT");
    	humidityUpLimit = resultSetForSettings.getInt("HUMID_UP_LIMIT");
    	batteryLevelDownLimit = resultSetForSettings.getInt("BATTERY_DOWN_LIMIT");
    }
    
    // Sort the latest mote information according to their mote ID's
    //sortAccordingToMoteID(latestMoteInfoArray, tempCounter);
    
    for(int i=0; i<tempCounter; i++)
    {
    	/*
    	out.println("MOTE ID: "+latestMoteInfoArray[i].getMoteID());
    	out.println("INFO DATE: "+latestMoteInfoArray[i].getInfoDate());
    	out.println("INFO TIME: "+latestMoteInfoArray[i].getInfoTime());
    	out.println("TEMP: "+latestMoteInfoArray[i].getTemp());
    	out.println("HUMID: "+latestMoteInfoArray[i].getHumid());
    	*/
    	
		String[] partsOfMoteDate = latestMoteInfoArray[i].getInfoDate().split("-");
		String moteReportYear = partsOfMoteDate[0];
		int moteReportMonth = Integer.parseInt(partsOfMoteDate[1]);
		int moteReportDay = Integer.parseInt(partsOfMoteDate[2]);
		
		String[] partsOfMoteTime = latestMoteInfoArray[i].getInfoTime().split(":");
		int moteReportHour = Integer.parseInt(partsOfMoteTime[0]);
		String moteReportMinute = partsOfMoteTime[1];
		String moteReportSecond = partsOfMoteTime[2];
		String moteReportAmOrPm;
		
		// Convert the report hour to AM or PM (12-hour clock) format
		if(moteReportHour>=0 && moteReportHour<12)
		{
			moteReportAmOrPm = "AM";
		}
		else
		{
			moteReportHour = moteReportHour-12;
			moteReportAmOrPm = "PM";
		}
		
		if(moteReportHour == 0)
		{
			moteReportHour = 12;
		}
		
    	if(Integer.parseInt(latestMoteInfoArray[i].getTemp()) > temperatureUpLimit)
    	{
			arrayListForLatestMoteInfo.add(Integer.toString(latestMoteInfoArray[i].getMoteID()));
			arrayListForLatestMoteInfo.add(decimalFormatter.format(moteReportDay)+"."+decimalFormatter.format(moteReportMonth)+"."+moteReportYear);
			arrayListForLatestMoteInfo.add(moteReportHour+":"+moteReportMinute+" "+moteReportAmOrPm);
			//arrayListForLatestMoteInfo.add("The temperature <font color=red>has passed "+temperatureUpLimit+" °C</font> degrees with <b>"+latestMoteInfoArray[i].getTemp()+" °C</b> in the location of mote "+latestMoteInfoArray[i].getMoteID()+"!");
			arrayListForLatestMoteInfo.add("The temperature <font color=red>has passed "+temperatureUpLimit+" °C</font> degrees with <b>"+latestMoteInfoArray[i].getTemp()+" °C</b> in "+moteLocations.get(latestMoteInfoArray[i].getMoteID())+"!");
    	}
    	if(Integer.parseInt(latestMoteInfoArray[i].getTemp()) < temperatureDownLimit)
    	{
			arrayListForLatestMoteInfo.add(Integer.toString(latestMoteInfoArray[i].getMoteID()));
			arrayListForLatestMoteInfo.add(decimalFormatter.format(moteReportDay)+"."+decimalFormatter.format(moteReportMonth)+"."+moteReportYear);
			arrayListForLatestMoteInfo.add(moteReportHour+":"+moteReportMinute+" "+moteReportAmOrPm);
			//arrayListForLatestMoteInfo.add("The temperature <font color=darkblue>has gone below "+temperatureDownLimit+" °C</font> degrees with <b>"+latestMoteInfoArray[i].getTemp()+" °C</b> in the location of mote "+latestMoteInfoArray[i].getMoteID()+"!");
			arrayListForLatestMoteInfo.add("The temperature <font color=darkblue>has gone below "+temperatureDownLimit+" °C</font> degrees with <b>"+latestMoteInfoArray[i].getTemp()+" °C</b> in "+moteLocations.get(latestMoteInfoArray[i].getMoteID())+"!");
    	}
    	if(Integer.parseInt(latestMoteInfoArray[i].getHumid()) < humidityDownLimit)
    	{
			arrayListForLatestMoteInfo.add(Integer.toString(latestMoteInfoArray[i].getMoteID()));
			arrayListForLatestMoteInfo.add(decimalFormatter.format(moteReportDay)+"."+decimalFormatter.format(moteReportMonth)+"."+moteReportYear);
			arrayListForLatestMoteInfo.add(moteReportHour+":"+moteReportMinute+" "+moteReportAmOrPm);
			//arrayListForLatestMoteInfo.add("The humidity percentage <font color=darkblue>has gone below "+humidityDownLimit+"%</font> with <b>"+latestMoteInfoArray[i].getHumid()+"%</b> in the location of mote "+latestMoteInfoArray[i].getMoteID()+"!");
			arrayListForLatestMoteInfo.add("The humidity percentage <font color=darkblue>has gone below "+humidityDownLimit+"%</font> with <b>"+latestMoteInfoArray[i].getHumid()+"%</b> in "+moteLocations.get(latestMoteInfoArray[i].getMoteID())+"!");
    	}
    	if(Integer.parseInt(latestMoteInfoArray[i].getHumid()) > humidityUpLimit)
    	{
			arrayListForLatestMoteInfo.add(Integer.toString(latestMoteInfoArray[i].getMoteID()));
			arrayListForLatestMoteInfo.add(decimalFormatter.format(moteReportDay)+"."+decimalFormatter.format(moteReportMonth)+"."+moteReportYear);
			arrayListForLatestMoteInfo.add(moteReportHour+":"+moteReportMinute+" "+moteReportAmOrPm);
			//arrayListForLatestMoteInfo.add("The humidity percentage <font color=red>has passed "+humidityUpLimit+"%</font> with <b>"+latestMoteInfoArray[i].getHumid()+"%</b> in the location of mote "+latestMoteInfoArray[i].getMoteID()+"!");
			arrayListForLatestMoteInfo.add("The humidity percentage <font color=red>has passed "+humidityUpLimit+"%</font> with <b>"+latestMoteInfoArray[i].getHumid()+"%</b> in "+moteLocations.get(latestMoteInfoArray[i].getMoteID())+"!");
    	}
    	if(Integer.parseInt(latestMoteInfoArray[i].getBatteryLevel()) <= batteryLevelDownLimit)
    	{
			arrayListForLatestMoteInfo.add(Integer.toString(latestMoteInfoArray[i].getMoteID()));
			arrayListForLatestMoteInfo.add(decimalFormatter.format(moteReportDay)+"."+decimalFormatter.format(moteReportMonth)+"."+moteReportYear);
			arrayListForLatestMoteInfo.add(moteReportHour+":"+moteReportMinute+" "+moteReportAmOrPm);
			//arrayListForLatestMoteInfo.add("The battery level <font color=darkblue>has gone below "+batteryLevelDownLimit+"%</font> with <b>"+latestMoteInfoArray[i].getBatteryLevel()+"%</b> for mote "+latestMoteInfoArray[i].getMoteID()+"!");
			arrayListForLatestMoteInfo.add("The battery level <font color=darkblue>has gone below "+batteryLevelDownLimit+"%</font> with <b>"+latestMoteInfoArray[i].getBatteryLevel()+"%</b> for mote "+latestMoteInfoArray[i].getMoteID()+" ("+moteLocations.get(latestMoteInfoArray[i].getMoteID())+")!");
    	}
    }
    
    
	
%>


<!--  section icon box -->
<div class="grey content-area" id="iconbuttons" style="background-color: white;">
    <div class="container">
    
	    <%
		// If the viewing device is not mobile, then put some line breaks
		if(session.getAttribute("isMobile").toString().equalsIgnoreCase("false"))
		{
	  		%>
	    		<br/><br/><br/>
	    	<%
		}
	    %>
    
        <table class="table table-hover">
            <thead>
            <tr>
            <th colspan="4">
            <font color="black" size="3px">Latest Warning Reports</font>
            <br/>
            <img src="images/information.png" alt="Information" style="width:25px;height:25px">&emsp;<font size="2px"><i><b>Table below displays the extreme conditions between <% out.print(decimalFormatter.format(previousDay)+"."+decimalFormatter.format(previousMonth)+"."+previousYear+", "+currentHour+":"+decimalFormatter.format(currentMinutes)+" "+amORpm+" - "+decimalFormatter.format(currentDay)+"."+decimalFormatter.format(currentMonth)+"."+currentYear+", "+currentHour+":"+decimalFormatter.format(currentMinutes)+" "+amORpm); %></b></i></font>
            </th>
            </tr>
            <tr style="background-color:#4A4744; table-layout:fixed">
                <th><font color="white">Warning Date</font></th>
                <th><font color="white">Warning Time</font></th>
				<th><font color="white">Mote ID</font></th>
                <th><font color="white">Warning</font></th>
            </tr>
            </thead>
            <tbody>
            <%
            
            		if(arrayListForLatestMoteInfo.size() == 0)
            		{
            			%>
    						<tr>
    							<td colspan="4" style="border: 2px solid #DDDDDD;">No extreme cases detected, all good!</td>
						 	</tr>
						<%
            		}
            		else
            		{
                		for(int i=0; i<arrayListForLatestMoteInfo.size(); i=i+4)
                		{
    							%>
                					<tr>
                    					<td style="border: 2px solid #DDDDDD;"><% out.println(arrayListForLatestMoteInfo.get(i+1)); %></td>
                    					<td style="border: 2px solid #DDDDDD;"><% out.println(arrayListForLatestMoteInfo.get(i+2)); %></td>
										<td style="border: 2px solid #DDDDDD;"><% out.println(arrayListForLatestMoteInfo.get(i)); %></td>
                    					<td style="border: 2px solid #DDDDDD;"><% out.println(arrayListForLatestMoteInfo.get(i+3)); %></td>
                					</tr>
                				<%
                		}
            		}
            
            %>
            </tbody>
        </table>
        
        
        <b><font color="black" size="3px">Latest Mote Information</font></b>
        <br/>
        <img src="images/information.png" alt="Information" style="width:25px;height:25px">&emsp;<font size="2px"><i><b>Please click <a href="#" onclick="OpenNewWindow('images/guideline_for_latest_mote_info.png', 608, 119); return true;">here</a> to view the guidelines for the Latest Mote Information (LMI) Applet.</b></i></font>
        <br/><br/>
        
         
        <iframe src="javascript:false;" frameborder="0" style="position: fixed; top: 0px; left: 0px; width: 100%; height: 19.9%;"></iframe>
        
        <!-- 
        <center>
        <iframe width="640px" height="290pxpx" src="applet.jsp" frameborder="0" style="z-index: 2"></iframe>
        </center>
        !-->
         
        
        <%
        // If the viewing device is not a computer, show the LMI Applet
    	if(session.getAttribute("isMobile").toString().equalsIgnoreCase("false"))
    	{
        %>
	        <center>
		        <object type="application/x-java-applet" name="ETSMapApplet" width="64.8%" height="240px">
				    <param name="wmode" value="opaque">
					<param name="menu" value="false">
				    <param name="codebase" value="http://www.etrackingsoftware.com/EnvironmentTrackingSoftware/" />
				    <param name="code" value="MapApplet.class" />
				    <param name="archive" value="MapApplet.jar, ojdbc6.jar, mysql-connector-java-5.1.34-bin.jar" />
				    <param name="scriptable" value="true" />
				    <param name="mayscript" value="true" />
				</object>
			</center>
		<% 
    	}
        // If the viewing device is mobile, show an error message
    	else
    	{
    		out.print("<font color=\"red\"><b>ERROR:</b></font> We detected that you are accessing to ETS with your mobile device. Please login with your computer to view the LMI Applet.<br>");
    	}
		
		%>
		<br>
		 
        <!--
        <div align="center" style="position: relative; Z-INDEX: 10;">
        
       	<center>
 	    <script src="js/deployJava.js"></script>
		<script>
		
    	var attributes = {codebase:'http://localhost:8081/MineTrackingSystem/',
                      code:'MapApplet.class',
                      archive: 'MapApplet.jar, ojdbc6.jar',
                      width: '610', 
                      height: '260'};
	    var parameters = {java_arguments: '-Xmx256m'}; // customize per your needs
	    var version = '1.7' ; // JDK version
	    deployJava.runApplet(attributes, parameters, version);
	    
	    /*
	    
	    var _app = navigator.appName;

	    if (_app == 'Mozilla') {
	      document.write('<embed id="testapplet"
	    	       	   type="application/x-java-applet;version=1.6"
	    	           width="256" height="256" 
	    	           archive="MapApplet.jar, ojdbc6.jar"
	    	           code="MapApplet.class"
	    	           pluginspage="http://java.com/download/"
	    	           myParam="My Param Value" />');
	      }
	    else if (_app == 'Netscape') {
		      document.write('<OBJECT type="application/x-java-applet" 
		    		name="previewersGraph" width="360" height="320">'
		      		<param name="codebase" value="/applets" />
		      		<param name="code" value="my.full.class.Name" />
		      		<param name="archive" value="applets.jar" />
		      		<param name="scriptable" value="true" />
		      		<param name="mayscript" value="true" />
		      		<param name="file" value="/report_files/1-1272041330710YAIwK" />
	                </OBJECT>);
		      }
	    else if (_app == 'Microsoft Internet Explorer') {
	      document.write('<OBJECT ',
	                     'classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"',
	                     'width="610"',
	                     'height="260">',
	                     '<PARAM name="code" value="MapApplet.class">',
	                     '<PARAM name="archive" value="MapApplet.jar, ojdbc6.jar">',
	                     '<PARAM name="wmode" value="opaque">',
	                     '<PARAM name="menu" value="false">',
	                     '</OBJECT>');
	      }
	    else {
	      document.write('<p>Sorry, unsupported browser.</p>');
	      }
	    
	    */
	    
		</script>
		</center>

		</div>
		
		-->
        
        
        <table class="table table-hover">
            <thead>
            <tr>
            <th colspan="6">
            <img src="images/information.png" alt="Information" style="width:25px;height:25px">&emsp;<font size="2px"><i>Table below displays the latest 7 mote information.</i></font>
            </th>
            </tr>
            <tr style="background-color:#4A4744; table-layout:fixed">
                <th><font color="white">Info Date</font></th>
                <th><font color="white">Info Time</font></th>
                <th><font color="white">Mote ID</font></th>
                <th><font color="white">Light Status / Presence</font></th>
                <th><font color="white">Temperature</font></th>
                <th><font color="white">Humidity</font></th>
                <th><font color="white">Battery Level</font></th>
            </tr>
            </thead>
            <%
				if(!resultSetForMoteInformation.next())
					{
			%>
				<tr>
					<td colspan="7" style="border: 2px solid #DDDDDD;">No data found!</td>
				</tr>
			<%
					}
				else
					{
						do {
			%>
            <tbody>
            <tr>
                <td style="border: 2px solid #DDDDDD;">	
                		<%
							out.println(resultSetForMoteInformation.getString("DATE_FORMATTED"));
						%>
				</td>
				<td style="border: 2px solid #DDDDDD;">	
                		<%
							out.println(resultSetForMoteInformation.getString("INFO_TIME"));
						%>
				</td>
                <td style="border: 2px solid #DDDDDD;">
                   		<%
							out.println(resultSetForMoteInformation.getString("MOTE_ID"));
						%>
				</td>
                <td style="border: 2px solid #DDDDDD;">
                   		<%
							if(resultSetForMoteInformation.getString("PRESENCE").equalsIgnoreCase("ON"))
							{
								out.println("<font color=\"darkgreen\">ON / YES</font>");
							}
							else
							{
								out.println("<font color=\"red\">OFF / NO</font>");
							}
						%>
                </td>
                <td style="border: 2px solid #DDDDDD;">
                		<%
							out.println(resultSetForMoteInformation.getString("TEMPERATURE")+" °C");
						%>
                </td>
                <td style="border: 2px solid #DDDDDD;">
                		<%
							out.println(resultSetForMoteInformation.getString("HUMIDITY")+"%");
						%>
                </td>
                <td style="border: 2px solid #DDDDDD;">
                		<%
							out.println(resultSetForMoteInformation.getString("BATTERY_LEVEL")+"%");
						%>
                </td>
            </tr>
            <% }while(resultSetForMoteInformation.next());
				}
			%>
            </tbody>
        </table>
        
    </div>
</div>
<!-- / section -->

<br>
<!-- footer -->

<jsp:include page="footer.jsp" />