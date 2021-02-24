package main

import (
	"fmt"
	"os"
	"time"

	"github.com/montanaflynn/stats"
	log "github.com/sirupsen/logrus"
	async_io "github.com/yeluyang/async_io_go"
)

func main() {
	data := make(stats.Float64Data, 0, 1024)
	job := async_io.NewAsyncReadJob(os.Args[1:]...).WithBatch(32).WithDelimiter('\n')
	defer job.Close()
	for batch := range job.Run() {
		for i := range batch {
			d, err := time.ParseDuration(string(batch[i]))
			if err != nil {
				log.Fatalf("failed to parse duration: %s", err)
			}
			data = append(data, float64(d))
		}
	}
	report, err := StatsReport(data)
	if err != nil {
		log.Fatalf("failed to report: %s", err)
	}
	fmt.Println(report)
}

func StatsReport(s stats.Float64Data) (string, error) {
	min, err := s.Min()
	if err != nil {
		return "", err
	}
	max, err := s.Max()
	if err != nil {
		return "", err
	}
	mean, err := s.Mean()
	if err != nil {
		return "", err
	}
	p99, err := s.Percentile(99)
	if err != nil {
		return "", err
	}
	p90, err := s.Percentile(90)
	if err != nil {
		return "", err
	}
	p75, err := s.Percentile(75)
	if err != nil {
		return "", err
	}
	p50, err := s.Percentile(50)
	if err != nil {
		return "", err
	}
	p25, err := s.Percentile(25)
	if err != nil {
		return "", err
	}
	return fmt.Sprintf(
		"samples=%d, mean=%s, range=[%s : %s], percentile={ 25%%=%s, 50%%=%s, 75%%=%s, 90%%=%s, 99%%=%s }", s.Len(),
		time.Duration(mean), time.Duration(min), time.Duration(max),
		time.Duration(p25), time.Duration(p50), time.Duration(p75), time.Duration(p90), time.Duration(p99),
	), nil
}
