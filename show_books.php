<?php
    $conn = new mysqli('localhost','kerkezos','','library');

    if($conn->connect_error){
        die('Connection Failed : ' .$conn-> connect_error);
    }else{
        $sql = "SELECT bookname FROM books";
        $result = $conn->query($sql);
        if($result->num_rows>0){
            $row = $result->fetch_assoc();
            while($row = $result->fetch_assoc()){
                   echo $row['bookname'] ."<br>";
            }
        }
        else{
            echo "no books";
        }
    }
    $conn->close();
?>