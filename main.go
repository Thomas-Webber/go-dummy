package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	VERSION := os.Getenv("VERSION")

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "Welcome to my website!"+VERSION)
	})
	http.ListenAndServe(":8080", nil)
}
