<?php

$output=null;
$retval=null;
echo "Pull....";
echo "\n";
$out = exec("git pull https://".getenv('gitUser').":".getenv('gitPwd')."@".getenv("gitRepo")." ", $output, $retval);

?>