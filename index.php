<?php
    $dbhost = 'localhost';
    $dbuser = 'linda';
    $dbpass = 'passwd';
    $dbname = 'devops';

    $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

    if(! $conn ){
       die('Could not connect: ' . mysqli_connect_error());
    }

    echo 'Connexion réussie ---> ';
    
    $update_sql = "INSERT INTO Etudiant (name)
    VALUES ('John')";

    mysqli_select_db($con,"devops");
    $update_result = mysqli_query( $conn, $update_sql);

    if(! $update_result ) {
        die('Could not update data: ' . mysqli_error($conn));
    }
    
    $select_result=mysqli_query($conn, "SELECT count(*) as total from Etudiant");
    $data=mysqli_fetch_assoc($select_result);
    echo $data['total'] . ' étudiants';

    mysql_close($conn);

?>