#!/usr/bin/perl -w
use CGI;
$query = new CGI;


print $query->header(-charset => 'utf-8');
print $query->start_html('Saludo');

my ($sec,$min,$hour,$mday,$mon) = localtime(time);
my $pseason="";
my $season = fseason($mday, $mon);
if ($season) {
  $pseason = "de $season";
}

print $query->h3("Hora actual: $hour:$min:$sec");
print $query->br;
print $query->br;

if ($hour < 8 || $hour > 21) {
   print $query->h2("Buenas noches $pseason");
}
elsif ($hour > 8 && $hour < 14) {
   print $query->h2("Buenos dias $pseason");
}else{
	print $query->h2("Buenas tardes $pseason");
}

print $query->end_html;

sub fseason($$) {
  # obtiene la estación entre el 01/09 y 31/12
  my $mday=shift;
  my $mon=shift;
  my $season = "";
  if($mon>=9 and $mon <=10) {
    $season = "otoño"; 
  }
  if($mon == 8) {
    if($mday >= 22) {
       $season = "otoño"; 
    }    
    else {
       $season = "verano"; 
    }
  }
  if($mon == 11){
    if($mday <= 20) {
       $season = "otoño"; 
    }
    else {
       $season = "invierno"; 
    }
  }
  return $season;
}
