<body>
  <h1>Formulier</h1>
  <?php
  include_once 'config.php';
  if(isset($_POST['submit'])){ //check if form was submitted
    $time = 2;
    $cool = true;
    if($cool = true && isset($_POST['Time'])){ //check if form was submitted
      $time = $_POST['Time'];
      $datum = $_POST['Datum'];
      $nummer = $_POST['Nummer'];
      $Email = $_POST['Email'];
      $Naam = $_POST['voornaam'] .' '. $_POST['achternaam'];
      $stmt = $conn->prepare("SELECT * from rest_klant where Time = ". $time . " AND Datum = ".$datum . " AND Nummer = ". $nummer);
      $stmt->execute();
      if($stmt->rowCount() > 0)
      {
        echo 'sorry de tafel '. $nummer .' is al rond deze tijd bezet <br> De volgende mogelijkheden zijn er nog <br>'  ;
        $timeNa = $time + 1;
        $timeVoor = $time - 1;
        $stmtNa = $conn->prepare("SELECT * from rest_klant where Time = ". $timeNa . " AND Datum = ".$datum . " AND Nummer = ". $nummer);
        $stmtVoor = $conn->prepare("SELECT * from rest_klant where Time = ". $timeVoor . " AND Datum = ".$datum . " AND Nummer = ". $nummer);
        $stmtNa->execute();
        $stmtVoor->execute();
        if($stmtNa->rowCount() > 0 && $stmtVoor->rowCount() > 0) {
          echo 'Het uur erna en het uur ervoor niet mogelijk!';
        }
        elseif ($stmtNa->rowCount() > 0) {
          echo 'Het uur ervoor is mogelijlk!';
        }
        elseif ($stmtVoor->rowCount() > 0) {
          echo 'Het uur erna is mogelijk!';
        }
        else{
          echo 'Het uur ervoor en erna zijn mogelijk!';
        }
      }
      else{
        try {
          //insert one row
          $Datum = $_POST['Datum'];
          $Time = $_POST['Time'];
          $Nummer = $_POST['Nummer'];
          $Email = $_POST['Email'];
          $Naam = $_POST['voornaam'] .' '. $_POST['achternaam'];

          $stmt = $conn->prepare("INSERT INTO rest_klant (
            Naam, Email, Datum, Time, Nummer)VALUES(?, ?, ?, ?, ?)");
          $stmt->bindParam(1, $Naam);
          $stmt->bindParam(2, $Email);
          $stmt->bindParam(3, $Datum);
          $stmt->bindParam(4, $Time);
          $stmt->bindParam(5, $Nummer);
          $stmt->execute();
          $message = "Geachte ".$Naam.",\r\nUw reservering voor ".$Time. " OP " . $Datum . " tafel nummer: " . $Nummer . " is succesvol geboekt\r\nYay!";

// In case any of our lines are larger than 70 characters, we should use wordwrap()
$message = wordwrap($message, 70, "\r\n");

// Send email
mail($Email, 'Reservering', $message);

        }catch (PDOException $ex){
          $error = $ex->getMessage();
          echo $error;
        }
        echo $Naam;
      }
    }
  }
  
  ?>
  <form action="" method="POST">
  <h3>Voornaam</h3>
    <input type="text" name="voornaam" required>
    <br/>
    <h3>Achternaam</h3>
    <input type="text" name="achternaam" required>
    <br/>
    <h3>Email</h3> 
    <input type="text" name="Email" required>
    <br/>
    <h3>Tijd</h3>
    <input type="text" name="Time" required>
    <br/>
    <h3>Datum</h3>
    <input type="date" name="Datum" required>
    <br/>
    <h3>Tafel</h3>
    <select name="Nummer">
      <option name="Nummer" value="0">Kies een tafel</option>
      <?php
      for($i = 1; $i < 26; $i++){
        print('<option value='.$i.'>'.$i.'</option>');
      }
      ?>
    </select>      
    <input type="submit" name="submit">
  </form>
</body>
