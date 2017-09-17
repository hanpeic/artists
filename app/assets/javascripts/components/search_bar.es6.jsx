class SearchBar extends React.Component {
  constructor(props) {
    super(props);
    this.state = { country: this.props.country }
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({country: event.target.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.onSubmit(this.state.country.trim());
  }

  render () {
    return (
      <div style={{textAlign: 'center', marginBottom: '20px'}}>
        <h1>Artists</h1>
        <form onSubmit={this.handleSubmit} className="form-inline">
          <input type="text" placeholder="australia" className="form-control" value={this.state.country} onChange={this.handleChange} />
          <input type="submit" name="commit" className="btn btn-primary" value="Search" />
        </form>
      </div>
    );
  }
}
