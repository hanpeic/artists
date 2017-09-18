class Artists extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      country: '',
      artists: [],
      currentPage: 1,
      totalPages: 1,
      errorMessage: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateArtists = this.updateArtists.bind(this);
    this.handlePageClick = this.handlePageClick.bind(this);
  }

  handleSubmit(country) {
    if(country === '') {
      this.setState({
        artists: [],
        errorMessage: 'Please input a valid country name',
        totalPages: 1
      })
      return;
    }
    var url = '/artists/index.json?country=' + country;
    this.setState({
      country: country
    })
    sendRequest(url, this.updateArtists);
  }

  handlePageClick(page) {
    var url = '/artists/index.json?country=' + this.state.country + '&page=' + page;
    sendRequest(url, this.updateArtists);
  }

  updateArtists(data) {
    if(data.error === undefined) {
      this.setState({
        artists: data.topartists.artist,
        currentPage: parseInt(data.topartists["@attr"].page),
        totalPages: parseInt(data.topartists["@attr"].totalPages),
        errorMessage: ''
      });
    }
    else {
      this.setState({
        artists: [],
        errorMessage: data.message,
        totalPages: 1
      })
    }
  }

  render () {
    return (
      <div>
        <SearchBar country='' onSubmit={this.handleSubmit} />
        <ArtistTable artists={this.state.artists} />
        <Pagination totalPages={this.state.totalPages} currentPage={this.state.currentPage} fetchData={this.handlePageClick} />
        <WarningBanner message={this.state.errorMessage} />
      </div>
    );
  }
}
