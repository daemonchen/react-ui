package controllers

import "github.com/revel/revel"

type Logout struct {
    *revel.Controller
}

func (c Logout) Index() revel.Result {
    return c.Render()
}
