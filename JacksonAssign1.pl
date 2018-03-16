#!/usr/bin/perl

###############################
# Zenith Jackson Assignment 1 #
#  TinyLang Lexical Analyzer  #
###############################

use strict;
use warnings;

my $file = "in3.tinyl";
my $outFile = "out3.txt";

my @out = analyze($file); #sends file to subroutine and array of TinyLang is returned


########################################
open (my $FH, '>', $outFile) 
	or die "problem opening $outFile\n";
	foreach my $var (@out)
	{
		print $FH  $var."\n";
	}
close($FH);
# creates a file and prints @out to it #

print "\n\n********Completed********\n\n";

sub analyze
{
	#######################
	my ($filename) = @_;
	my $fullFile = "";
	open(my $file, '<', $filename) 
		or die "Unable to open file, $!";
	while (my $row = <$file>)
	{
		chomp $row;
		$fullFile = $fullFile . " " . $row;
	}
	close($file)
		or warn "Unable to close file: $!";
	#### Reads File and puts it into one string ####
	
	
	my @splitFile = split(/\s+/, $fullFile); 
	
	my @tinyLang;
	
	foreach my $var (@splitFile)
	{
		my $var2 = ""; #var for (
		my $var3 = ""; #var for )
		my $var4 = "";#var for ;
		my $var5 = ""; #var for anything between ( and )
		if ($var =~ m/[^\w\s]+/)
		{
			if ($var =~ m/\(/) 
			{
				$var2 = "(";
				if ($var =~ m/(?<=\()./)
				{
					my @vars = split(/\(/, $var); 
					$var5 = pop @vars; #add last part to $var5
					$var = pop @vars; #add first part to $var
					if ($var5 =~ m/\)/)
					{
						$var3 = ")";
						$var5 =~ s/\)//g; 
					}
					if ($var5 =~ m/;/)
					{
						$var4 = ";";
						$var5 =~ s/\;//g; 
					}
				}
				$var =~ s/\(//g; 
			}
			if ($var =~ m/\)/)
			{
				$var3 = ")";
				$var =~ s/\)//g; 
			}
			if ($var =~ m/;/)
			{
				$var4 = ";";
				$var =~ s/\;//g; 
			}
			if($var =~ m/\+/)
			{
				push @tinyLang, "$var OP_PLUS";
			}
			if($var =~ m/-/)
			{
				push @tinyLang, "$var OP_MINUS"
			}
			if($var =~ m/\*/)
			{
				push @tinyLang, "$var OP_MULT";
			}
			if($var =~ m/\//)
			{
				push @tinyLang, "$var OP_DIV";
			}
			if($var =~ m/=/)
			{
				push @tinyLang, "$var OP_EQ";
			}
			if($var =~ m/^"/)
			{
				if($var =~ m/"$/)
				{
					if($var =~ m/^\\"/)
					{
						push @tinyLang, "$var UNDEFINED";
					}
					else
					{
						push @tinyLang, "$var S_LITERAL";
					}
				}
			}
			if($var =~ m/^\\$/)
			{
				push @tinyLang, "$var UNDEFINED";
			}
		}
			
		if($var =~ m/^[A-Za-z_]\w*/)
		{
			push @tinyLang, "$var IDENT_OR_KEY";
		}
		if($var =~ m/^\d/)
		{
			if ($var =~ m/[^\d]/)
			{
				push @tinyLang, "$var UNDEFINED";
			}
			else
			{
				push @tinyLang, "$var I_LITERAL";
			}
		}
				
		if($var2 =~ m/\(/)
		{
			push @tinyLang, "$var2 L_PAREN";
		}
		if($var5 ne "")
		{
			if($var5 =~ m/^[A-Za-z_]\w*/)
			{
				push @tinyLang, "$var5 IDENT_OR_KEY";
			}
			if($var5 =~ m/^\d/)
			{
				if ($var5 =~ m/[^\d]/)
				{
					push @tinyLang, "$var5 UNDEFINED";
				}
				else
				{
					push @tinyLang, "$var5 I_LITERAL";
				}
			}
			if($var5 =~ m/^"/)
			{
				if($var5 =~ m/"$/)
				{
					if($var5 =~ m/^\\"/)
					{
						push @tinyLang, "$var5 UNDEFINED";
					}
					else
					{
						push @tinyLang, "$var5 S_LITERAL";
					}
				}
			}
		}
		if($var3 =~ m/\)/)
		{
			push @tinyLang, "$var3 R_PAREN";
		}
		if($var4 =~ m/;/)
		{
			push @tinyLang, "$var4 SEMI";
		}
	}#end foreach
	return @tinyLang;
}#end sub


	
