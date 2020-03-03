<?php
    $conn = new mysqli('localhost','kerkezos','','library');

    if($conn->connect_error){
        die('Connection Failed : ' .$conn-> connect_error);
    }else{
        $sql = "SELECT authorname FROM authors";
        $result = $conn->query($sql);
        if($result->num_rows>0){
            $row = $result->fetch_assoc();
            while($row = $result->fetch_assoc()){
                   echo $row['authorname'] ."<br>";
            }
        }
        else{
            echo "no authors";
        }
    }
    $conn->close();
?>