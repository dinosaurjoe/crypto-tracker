import React, { Component } from 'react'
import axios from 'axios'


class Search extends Component {
  state = {
     query: '',
     results: []
   }

  const apiUrl = "https:/" + "/min-api.cryptocompare.com/data/top/exchanges/full?fsym=#"

  getInfo = () => {
      axios.get(`${apiUrl}${this.state.query}&tsym=USD`)
        .then(({ data }) => {
          this.setState({
            results: data.data
          })
        })
  }

 handleInputChange = () => {
    this.setState({
      query: this.search.value
    }, () => {
      if (this.state.query && this.state.query.length > 1) {
        if (this.state.query.length % 2 === 0) {
          this.getInfo()
        }
      }
    })
  }

  render() {
    return (
      <form>
        <input
          placeholder="Search for..."
          ref={input => this.search = input}
          onChange={this.handleInputChange}
        />
        <p>{this.state.query}</p>
      </form>
    )
  }
}

export default Search
