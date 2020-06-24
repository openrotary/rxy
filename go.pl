#!/usr/bin/perl -w

use strict;
use feature qw(say);

my ($read_url, $write_url) = @ARGV;

open READ, "<$read_url" or die "$!";
open WRITE, ">$write_url" or die "$!";

my $isComment = 0;
my $openParamTable = 0;

while(<READ>) {
	if($_ =~ /\/\*{2}/) {
		$isComment = 1;
		next;
	}
	if($_ =~ /\*\//) {
		print WRITE "\n";
		$openParamTable = 0;
		$isComment = 0;
		next;
	}
	if($isComment) {
		$_ =~ /\*/;
		my $space_len = length $`;

		# 解析 @name
		if($_ =~ /\@name\s/) {
			my $title = '#' x ($space_len < 6 ? $space_len : 6);
			print WRITE "$title $'";
			next;
		}

		# 解析 @description
		if($_ =~ /\@description\s/) {
			my $text = $';
			$text =~ s/(\w{2,}|(\w\S\w))+?/`$&`/g;
			$text =~ s/`{2}//g;

			# 添加代码符号
			print WRITE "\n**描述**： $text";
			next;
		}

		# 解析 @returns
		if($_ =~ /\@returns\s/) {
			my $text = $';
			$text =~ s/[\{\}]//g;

			# 添加代码符号
			print WRITE "\n\n**返回值类型**： $text";
			next;
		}

		# 解析 @param
		if($_ =~ /\@param\s/) {
			if(!$openParamTable) {
				$openParamTable = 1;
				print WRITE "\n| 参数名 | 参数类型 | 是否必传 |参数描述 |";
				print WRITE "\n| --- | --- | --- | --- |";
			}
			my ($type, $name, $label) = split ' ', $';
			my $isNeed = '必传';

			# 剔除 { } 符号
			$type =~ s/[\{\}]//g;
			$label = $label || '暂无描述';
			if($name =~ /[\[\]]/) {
				$isNeed = '非必传';
				$name =~ s/[\[\]]//g;
			}
			print WRITE "\n| $name | $type | $isNeed | $label |";
			next;
		}
	}
}

close READ;
close WRITE;
