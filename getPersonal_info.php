<?php

// Create Connection
// $con=mysqli_connect("localhost","database_user","password","database")
$con=mysqli_connect("localhost:3306","adamkitc_doctor","hackusu","adamkitc_patients");

// Check connection
if (mysqli_connect_errno())
{
	echo "Failed to connect to  MySQL: ", mysqli_connect_error();
}

// Select all columns from the Personal_info table
$sql = "SELECT = FROM personal_info";

// Check if there are results
if ($result = mysqli_query($con, $sql))
{
	// If so, then create a results array and a temporary one
	// to hold the data
	$resultArray = array();
	$tempArray = array();

	// Loop through each row in the result set
	while($row = $result->fetch_object())
	{
		// Add each row into our results array
		$tempArray $row;
		array_push($resultsArray, $tempArray);
	}

	// Finally, encode the array to JSON and output the results
	echo json_encode($resultsArray);
}

// Close connection
mysqli_close($con);
?>
