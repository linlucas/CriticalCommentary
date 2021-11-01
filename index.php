<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/cs/font-awesome.min.css" rel="stylesheet">
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css" rel="stylesheet" type='text/css'><title>The Critics</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>
<form name="form" method="get" action="index.php">
        <div class = 'search-container'>
            <div class="search-box">
                <button type= "submit" name = "submit" class="btn-search"><i class="fas fa-search"></i></button>
                <input type="text" class="input-search" placeholder="" name='movie_name'>
            </div>
            <div class = 'dropdown-filter'>
                <i class = 'fas fa-list'></i>
                <div class = 'dropdown-content'>
                    <select name="year" id="year">
                        <option value="" selected hidden>
                            Year
                        </option>
                        <option value="1990">1990-1999</option>
                        <option value="2000">2000-2010</option>
                        <option value="2010">2010-</option>
                    </select>
                    
                    <select name="genre" id="genre">
                        <option value="" selected hidden>
                            Genre
                        </option>
                        <option value="drama">drama</option>
                        <option value="sci-fi">sci-fi</option>
                        <option value="romance">romance</option>
                        <option value="action">action</option>
                    </select>
                    <br>
                    <select name="rating" id="rating">
                        <option value="" selected hidden>
                            Rating
                        </option>
                        <option value="1">1+</option>
                        <option value="2">2+</option>
                        <option value="3">3+</option>
                        <option value="4">4+</option>
                        <option value="5">5+</option>
                        <option value="6">6+</option>
                        <option value="7">7+</option>
                        <option value="8">8+</option>
                        <option value="9">9+</option>
                    </select>

                    <select name="language" id="language">
                        <option value="" selected hidden>
                            Language
                        </option>
                        <option value="English">English</option>
                        <option value="Spanish">Spanish</option>
                        <option value="Korean">Korean</option>
                        <option value="Chinese">Chinese</option>
                    </select>
                    
                    <select name="pg_rating" id="pg_rating"  default="a">
                        <option value="" selected hidden>
                            PG Rating
                        </option>
                        <option value="G">G</option>
                        <option value="PG">PG</option>
                        <option value="PG-13">PG-13</option>
                        <option value="R">R</option>
                        <option value="NC-17">NC-17</option>
                    </select>
                </div>
            </div>
        </div>
    </form>

<?php

$url = parse_url(getenv("CLEARDB_DATABASE_URL"));

$server = $url["host"];
$username = $url["user"];
$password = $url["pass"];
$db = substr($url["path"], 1);
echo "\n\n\n\ db follows ";
echo $db;

$conn = new mysqli($server, $username, $password, $db);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "\n\nConnected successfully";

    function display($row, $mode){
        $INIT = 0;
        $NO_MATCH = 1;
        $NORMAL = 2;
        if ($mode == $INIT){ 
            echo "
            <div class='card'>
                <div class='card_left'>
                    <img src='". $row['poster_link'] ."'/>
                </div>
                <div class='card_right'>
                    <h2> PICK OF THE DAY </h2>
                    <h1>". $row['name'] . "
                    </h1>
                    <div class='card_right__details'>
                    <ul>
                        <li>". $row['release_year'] ."</li>
                        <li>". $row['age_rating'] ."</li>
                        <li>". $row['genre'] ."</li>
                    </ul>
                    <div class='card_right__review'>
                        <p>
                            <h2>". "Parental Advisory" ."</h2>
                            <li>". "Violence: ". $row['violence'] ."</li>
                            <li>". "Sex & Nudity: ". $row['sex_nudity'] ."</li>
                            <li>". "Drugs & Alcohol: ". $row['drug_alcohol'] ."</li>
                        </p>
                        <p>
                            <h2>". "Box Office" ."</h2>
                            <li>". "Gross Profit: $". number_format($row['gross_profit']) ."</li>
                            <li>". "Weeks in Theatre: ". $row['weeks_in_theater'] ."</li>
                            <li>". "budget: $". number_format($row['budget']) ."</li>
                        </p>
                        <p>
                            <h2>". "Rating"."
                            <li>". number_format($row['avg'], 1, '.', '')."/10" ."</li>
                        </p>
                    </div>
                    <div class='card_right__button'>
                        <a href='". $row['trailer_link'] ."' target='_blank'>WATCH TRAILER</a>
                    </div>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <br>
            ";
        }
        elseif ($mode == $NORMAL) {
            echo "
            <div class='card'>
                <div class='card_left'>
                    <img src='". $row['poster_link'] ."'/>
                </div>
                <div class='card_right'>
                    <h1>". $row['name'] . "
                    </h1>
                    <div class='card_right__details'>
                    <ul>
                        <li>". $row['release_year'] ."</li>
                        <li>". $row['age_rating'] ."</li>
                        <li>". $row['genre'] ."</li>
                    </ul>
                    <div class='card_right__review'>
                        <p>
                            <h2>". "Parental Advisory" ."</h2>
                            <li>". "Violence: ". $row['violence'] ."</li>
                            <li>". "Sex & Nudity: ". $row['sex_nudity'] ."</li>
                            <li>". "Drugs & Alcohol: ". $row['drug_alcohol'] ."</li>
                        </p>
                        <p>
                            <h2>". "Box Office" ."</h2>
                            <li>". "Gross Profit: $". number_format($row['gross_profit']) ."</li>
                            <li>". "Weeks in Theatre: ". $row['weeks_in_theater'] ."</li>
                            <li>". "budget: $". number_format($row['budget']) ."</li>
                        </p>
                        <p>
                            <h2>". "Rating"."
                            <li>". number_format($row['avg'], 1, '.', '')."/10" ."</li>
                        </p>
                    </div>
                    <div class='card_right__button'>
                        <a href='". $row['trailer_link'] ."' target='_blank'>WATCH TRAILER</a>
                    </div>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <br>
            ";
        }
        else {
            echo "
            <div class='card'>
                <div class='card_left'>
                    <img src='". $row['poster_link'] ."'/>
                </div>
                <div class='card_right'>
                    <p> Sorry, we couldn't find a match </p>
                    <h2> YOU MIGHT BE INTERESTED IN </h2>
                    <h1>". $row['name'] . "
                    </h1>
                    <div class='card_right__details'>
                    <ul>
                        <li>". $row['release_year'] ."</li>
                        <li>". $row['age_rating'] ."</li>
                        <li>". $row['genre'] ."</li>
                    </ul>
                    <div class='card_right__review'>
                        <p>
                            <h2>". "Parental Advisory" ."</h2>
                            <li>". "Violence: ". $row['violence'] ."</li>
                            <li>". "Sex & Nudity: ". $row['sex_nudity'] ."</li>
                            <li>". "Drugs & Alcohol: ". $row['drug_alcohol'] ."</li>
                        </p>
                        <p>
                            <h2>". "Box Office" ."</h2>
                            <li>". "Gross Profit: $". number_format($row['gross_profit']) ."</li>
                            <li>". "Weeks in Theatre: ". $row['weeks_in_theater'] ."</li>
                            <li>". "budget: $". number_format($row['budget']) ."</li>
                        </p>
                        <p>
                            <h2>". "Rating"."
                            <li>". number_format($row['avg'], 1, '.', '')."/10" ."</li>
                        </p>
                    </div>
                    <div class='card_right__button'>
                        <a href='". $row['trailer_link'] ."' target='_blank'>WATCH TRAILER</a>
                    </div>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <br>
            ";
        }
    }
    if(isset($_GET["submit"]))
    {
        $head = 'select * from';
        $from = 'movies Natural Join box_office Natural Join parental_advisory NATURAL JOIN avg_rating';
        $movie_name = $_GET["movie_name"];
        $where = '';
        $query = '';
        $year = $_GET["year"];
        $genre = $_GET['genre'];
        $language = $_GET['language'];

        $rating = $_GET["rating"];
        $pg = $_GET['pg_rating'];
        $and = 0;

        if ($movie_name){
            $where = sprintf("name = '%s'", $movie_name);
            $and = 1;
        }
        if ($year){
            if ($and == 1){
                $where = sprintf("%s and release_year >= %s and release_year < %s + 10", $where, $year, $year);
            }
            else{
                $where = sprintf("%s release_year >= %s and release_year < %s + 10", $where, $year, $year);
                $and = 1;
            }
        }
        if ($genre){
            if ($and == 1){
                $where = sprintf("%s and genre = '%s'", $where, $genre);
            }
            else {
                $where = sprintf("%s genre = '%s'", $where, $genre);
                $and = 1;
            }
        }
        if ($rating){
            if ($and == 1){
                $where = sprintf("%s and avg > %s", $where, $rating);
            }
            else {
                $where = sprintf("%s avg > %s", $where, $rating);
                $and = 1;
            }
        }
        if ($pg){
            if ($and == 1){
                $where = sprintf("%s and age_rating = '%s'", $where, $pg);
            }
            else {
                $where = sprintf("%s age_rating = '%s'", $where, $pg);
            }
        }
        if ($language){
            if ($and == 1){
                $where = sprintf("%s and language = '%s'", $where, $language);
            }
            else {
                $where = sprintf("%s language = '%s'", $where, $language);
            }
        }
        if ($where){
            $query = $head . ' ' . $from . ' where ' . $where;
        }
        else {
            $query = $head . ' ' . $from;
        }


        //$res = mysqli_query($conn, $query);
        $res = conn->query($query);
        for ($x = 0; $x <= 3; $x++) {
            echo "<br>";
        }
        if (mysqli_num_rows($res) == 0){
            $query = 'select * from movies Natural Join box_office Natural Join parental_advisory NATURAL JOIN avg_rating order by rand() limit 1'; //left outer join
            $res = conn->query($query);
            //$res = mysqli_query($conn, $query);
            $row = mysqli_fetch_array($res);
            display($row, 1);
        }
        else {
            while($row = mysqli_fetch_array($res)){
                display($row, 2);

                for ($x = 0; $x <= 3; $x++) {
                    echo "<br>";
                }
            }
        }
    }
    else {
        for ($x = 0; $x <= 3; $x++) {
            echo "<br>";
        }
        //$query = 'select * from movies Natural Join box_office Natural Join parental_advisory NATURAL JOIN avg_rating order by rand() limit 1';
        $query = "SELECT * FROM movies";
        $results = conn->query($query);


if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo $row;
    echo "\n\n";
  }
} else {
  echo "0 results";
}

        //$row = mysqli_fetch_array($res);
        //display($row, 0);
    }
    conn->close();
?>

</body>
</html>
