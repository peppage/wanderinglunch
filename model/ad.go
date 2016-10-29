package model

import (
	"errors"
	"wanderinglunch/util"
)

type Ad struct {
	ID         int    `json:"id"`
	Name       string `json:"name"`
	Value      string `json:"value"`
	ValidUntil int64  `json:"validUntil"`
	Views      int    `json:"views"`
	Site       string `json:"site"`
}

type AdStack struct {
	adStacks map[string]*util.Stack
}

func (a *AdStack) GetAd(siteName string) (*Ad, error) {
	if a.adStacks == nil {
		a.adStacks = make(map[string]*util.Stack)
	}

	if val, ok := a.adStacks[siteName]; !ok || val.Len() == 0 {
		return nil, errors.New("No ads on stack")
	}
	temp, _ := a.adStacks[siteName].Pop()
	ad := temp.(Ad)
	return &ad, nil
}

func (a *AdStack) Fill(ads []*Ad, siteName string) {
	a.adStacks[siteName] = &util.Stack{}

	for _, ad := range ads {
		a.adStacks[siteName].Push(ad)
	}
}
