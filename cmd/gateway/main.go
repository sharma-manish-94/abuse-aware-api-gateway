package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		fmt.Print(w, "gateway ok")
	})

	log.Println("gateway listening on :8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
