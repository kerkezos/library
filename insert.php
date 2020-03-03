<?php
    $bookname = $_POST['bookname'];
    $author = $_POST['author'];

    $conn = new mysqli('localhost','kerkezos','','library');

    if($conn->connect_error){
        die('Connection Failed : ' .$conn-> connect_error);
    }else{

        $sql = "SELECT authorid FROM authors WHERE authorname='$author'";
        $result = $conn->query($sql);
        if($result->num_rows>0){
            $row = $result->fetch_assoc();
            $sql = "SELECT bookid FROM books WHERE bookname='$bookname'";
            $result = $conn->query($sql);
            $row2=$result->fetch_assoc();

            if($result->num_rows==0){
                echo "new book inserted but the author exists";
                $stmt = $conn->prepare("INSERT INTO books
                VALUES(NULL , ?, ?)");
                $stmt->bind_param('si', $bookname, $row["authorid"]);
                $stmt->execute();
            }
            else{
                echo "The book you are trying to insert is already in the database";
            }
            }
            else{
                $stmt = $conn->prepare("INSERT INTO authors
                VALUES(NULL , ?)");
                $stmt->bind_param('s', $author);
                $stmt->execute();

                $sql = "SELECT authorid FROM authors WHERE authorname='$author'";
                $result = $conn->query($sql);
                $row = $result->fetch_assoc();

                //ton vazw kai sto table books

                $stmt = $conn->prepare("INSERT INTO books
                VALUES(NULL , ?, ?)");
                $stmt->bind_param('si', $bookname, $row["authorid"]);
                $stmt->execute();


                $stmt->close();
                $conn->close();
                }


    }
?>