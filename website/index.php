<?php

$servername = "10.10.20.11"; 
$username = "vagrant_user";
$password = "Admin$00";
$dbname = "vagrant";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connessione fallita: " . $conn->connect_error);
}

$sql = "SHOW TABLES";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "Connessione riuscita! Tabelle presenti nel database:<br>";
    while ($row = $result->fetch_assoc()) {
        echo $row["Tables_in_$dbname"] . "<br>";
    }
} else {
    echo "Connessione riuscita, ma non ci sono tabelle nel database.";
}


$conn->close();
?>

<h1>Funziona!!!</h1>