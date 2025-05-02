package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
	"strconv"
)

func main(){

	target := ""

	if len(os.Args) < 2{
		target = "CKS.TXT"
	}else{
		target = os.Args[1]
	}

	root := "DDL.SQL"

	file, err := os.Open(root)
	if err != nil{
		fmt.Println("Error on file open: ", err)
		return
	}
	defer file.Close()

	target_file, err := os.Create(target)
	if err != nil{
		fmt.Println("Error on create file: ", err)
		return
	}
	defer target_file.Close()

	pattern := `CK(\d+)\w+`
	regexCK := regexp.MustCompile(pattern)

	var checks [21]string
	
	scanner := bufio.NewScanner(file)
	for scanner.Scan(){
		line := scanner.Text()

		groups := regexCK.FindStringSubmatch(line)
		if len(groups) > 1{
			num, err := strconv.Atoi(groups[1])
			if err != nil{
				fmt.Println("Error on int conversion ", err)
			}
			checks[num] = groups[0]
		}
	}

	for _, check := range checks{
		fmt.Fprintln(target_file,check)
	}

}