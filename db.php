<?php
$conection = mysqli_connect(
    'localhost',
    'root',
    '',
    'IGBJ'
);

if (isset($conection)){
    echo 'DB code = 200';
}

?>