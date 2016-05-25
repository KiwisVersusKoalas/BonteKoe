<?php require 'header.php';?>
<!-- HTML HERE -->
<body>
  <h1>Formulier</h1>
  <?php
  if(isset($_POST['submit'])){ //check if form was submitted
    $input = $_POST['email']; //get input text
    $message = "Success! je email is: ".$input;
  }
  if(isset($_POST['submit'])){ //check if form was submitted
    $stmt = $conn->prepare("SELECT * from rest_klant where Time = ". $time . " AND Datum = ".$datum . " AND Nummer = ". $nummer);
    $stmt->execute();
    if($stmt->rowCount() > 0)
    {
      echo 'sorry de tafel '. $table ' is al rond deze tijd bezet <br>
      De volgende mogelijkheden zijn er nog <br>'  ;
      $timeNa = $time + 1.00;
      $timeVoor = $time - 1.00;
      $stmtNa = $conn->prepare("SELECT * from rest_klant where Time = ". $timeNa . " AND Datum = ".$datum . " AND Nummer = ". $nummer);
      $stmtVoor = $conn->prepare("SELECT * from rest_klant where Time = ". $timeVoor . " AND Datum = ".$datum . " AND Nummer = ". $nummer);
      $stmtNa->execute();
      $stmtVoor->execute();
      if($stmtNa->rowCount() > 0 && $stmtVoor->rowCount() > 0)
      {
        'Het uur erna en het uur ervoor zijn mogelijk!'
      }
      elseif ($stmtNa->rowCount() > 0 && $stmtVoor->rowCount() != 0) {
        echo 'Het uur erna is mogelijlk!'
      }
      elseif ($stmtNa->rowCount() != 0 && $stmtVoor->rowCount() > 0) {
        echo 'Het uur ervoor is mogelijk!'
      }
      else{
        echo 'Het uur ervoor en erna zijn niet mogelijk!'
      }
    }

    ?>
    <form action="" method="POST">
      <?php echo $message; ?>
      <h3>Voornaam</h3>
      <input type="text" name="naam" required>
      <br/>
      <h3>Achternaam</h3>
      <input type="text" name="naam" required>
      <br/>
      <h3>Email</h3>
      <input type="text" name="email" required>
      <input type="submit" name="submit">
    </form>
    <!-- HTML HERE -->
    <?php require 'footer.php';?>
