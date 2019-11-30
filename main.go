package main

import (
    "fmt"
    "net/http"
    "os"
)

var VERSION = os.Getenv("VERSION")

func main()  {
  http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
    fmt.Fprint(w, "Welcome to my website!" + VERSION)
  })
  http.ListenAndServe(":8080", nil)
}