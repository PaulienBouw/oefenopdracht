<html>
<head>
<title>Huiswerk pagina opdracht 12</title>
<!--<link href="css/css-reset.css" rel="stylesheet" type="text/css">
<link href="css/styles.css" rel="stylesheet" type="text/css"> -->
</head>
<body>
<header>
	<h1>Welkom bij mijn oefenopdracht</h1>
</header>
<main>
<?php
ini_set('error.reporting', E_ALL);
ini_set('display_errors', false);

$br = "<br>\n";
	
$localhost  = "localhost"; 
$username   = "root"; 
$password   = "root"; 
$dbname     = "cmm_autos";  
$con = new mysqli($localhost, $username, $password, $dbname); 
if( $con->connect_error){
   die('Error: ' . $con->connect_error);
} 
$sql = 'SELECT merken.id, merken.naam, merken.land, autos.title, autos.kleur, autos.type, autos.brandstof 
		FROM merken 
		LEFT JOIN autos ON merk_id = merken.id 
		LEFT JOIN landen ON land_id = merken.id
		ORDER BY id';

// als search (submit) aangeklikt is, maak dan een variabele aan van de waarde in search en doe er iets veiligs mee zodat gebruiker niet eigen script kan invoeren
// dan zoekwoord opslaan als variabele en toepassen in query als zoekfunctie



/*
 * Hier definiëer ik de standaard sorteer waarde
 * Als de sorteer waarde is meegegeven dan vervang ik deze waarde
 */
$sorteer = 'ID';
if( isset($_GET['sort']) ){  
	$sorteer = mysqli_real_escape_string($con, htmlspecialchars($_GET['sort'])); 
}

/*
 * In deze query zorg ik dat de ORDER by altijd volgens de sorteer waarde gebeurd
 * Hierdoor heb ik geen andere query meer nodig
 * Let op het quote gebruik bij de ORDER BY, ik gebruik daar geen quotes
 */
if( isset($_GET['search']) ){  
  $zoekwoord = mysqli_real_escape_string($con, htmlspecialchars($_GET['search'])); 
  $sql = "SELECT merken.id, merken.naam, merken.land, autos.title, autos.kleur, autos.type, autos.brandstof 
  			FROM merken 
  			LEFT JOIN autos ON merk_id = merken.id 
  			LEFT JOIN landen ON land_id = merken.id
  			WHERE naam LIKE '%{$zoekwoord}%' 
  			OR type LIKE '%{$zoekwoord}%' 
  			ORDER BY $sorteer";
}

//echo "Ik wil sorteren op:".$sorteer;
$result = $con->query($sql);
?>
<div class="container"> 
    <label>Zoek je auto</label>
	<?php
	/* 
	 * Zoals je ziet heb ik hier de verschillende formulieren samen gevoegd zodat de waardes bewaard blijven
	 */
	?>
    <form method="get">
    	<!-- als zoekwoord is ingevuld, onthoudt de value dan -->
        <input type="text" placeholder="Zoek je auto" name="search" value="<?php if (isset($_GET["search"])) {echo $zoekwoord;}?>">
      	<select name="sort">
      	<option value="naam" <?php if( 'naam' == $sorteer ) { echo 'selected'; } ?>>naam</option>
  		<option value="land" <?php if( 'land' == $sorteer ) { echo 'selected'; } ?>>land</option>
  		<option value="type" <?php if( 'type' == $sorteer ) { echo 'selected'; } ?>>type</option>
  		<option value="kleur" <?php if( 'kleur' == $sorteer ) { echo 'selected'; } ?>>kleur</option>
  		<option value="brandstof" <?php if( 'brandstof' == $sorteer ) { echo 'selected'; } ?>>brandstof</option>
  		</select>		 
 		<input type="submit" value="Sort / Search" name="btn">
    </form>
    <h2>Lijst met auto's</h2>
    <table>
        <tr>
			<th>Id</th>
			<th>Naam</th>
			<th>Land</th>
			<th>titel</th>
			<th>kleur</th>
			<th>type</th>
			<th>brandstof</th>
        </tr>


        <?php 
        	//ga terug naar verse webpagina om volledig overzicht te zien
        	echo "<a href='form.php'> Laat alle auto's zien</a>"; 
        	// zolang er waarde is in de $row vul dan de tabel.
	    	while($row = $result->fetch_assoc()){
	        	echo "<tr>
	                <td>".$row['id']."</td>
	                <td>".$row['naam']."</td>
	                <td>".$row['land']."</td>
	              	<td>".$row['title']."</td>
	                <td>".$row['kleur']."</td>
	                <td>".$row['type']."</td>
	                <td>".$row['brandstof']."</td> 
	            	</tr>";

	    	}
	    	// als result geen waarde anders dan nul heeft, is er geen match gevonden tussen Database en zoekresultaat
	    	if(0 ===mysqli_num_rows($result)){ 
    			echo "Geen auto's gevonden met deze zoekopdracht";
    		}
        	
        ?>
    </table>
</div>
</main>
<footer>
	
</footer>
</body>	
</html>