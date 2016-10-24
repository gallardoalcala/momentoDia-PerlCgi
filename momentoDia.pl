#!/usr/bin/perl -w
use CGI;
$query = new CGI;
print $query->header;
print $query->start_html('Saludo');

my ($sec,$min,$hour) = localtime(time);

print "Hora actual: $hour:$min:$sec <br><br>";


if ($hour < 8 || $hour > 21) {
   print $query->h2("Buenas noches");
}
elsif ($hour > 8 && $hour < 14) {
   print $query->h2("Buenos dias");
}else{
	print $query->h2("Buenas tardes");
}

print $query->end_html;

