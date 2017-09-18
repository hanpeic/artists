class Artist extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tracks: [],
      currentPage: 1,
      totalPages: 1,
      errorMessage: ''
    };
    this.updateTracks = this.updateTracks.bind(this);
    this.handlePageClick = this.handlePageClick.bind(this);
  }

  componentDidMount() {
    var url = '/artists/' + this.props.name + '.json';
    sendRequest(url, this.updateTracks);
  }

  handlePageClick(page) {
    var url = '/artists/' + this.props.name + '.json?&page=' + page;
    sendRequest(url, this.updateTracks);
  }

  updateTracks(data) {
    if(data.error === undefined) {
      this.setState({
        tracks: data.toptracks.track,
        currentPage: parseInt(data.toptracks["@attr"].page),
        totalPages: parseInt(data.toptracks["@attr"].totalPages),
        errorMessage: ''
      });
    }
    else {
      this.setState({
        tracks: [],
        errorMessage: data.message,
        totalPages: 1
      });
    }
  }

  render () {
    return (
      <div>
        <div style={{textAlign: 'center', marginBottom: '20px'}}>
          <h1>{this.props.name}</h1>
        </div>
        <TrackTable tracks={this.state.tracks} />
        <Pagination totalPages={this.state.totalPages} currentPage={this.state.currentPage} fetchData={this.handlePageClick} />
        <WarningBanner message={this.state.errorMessage} />
      </div>
    );
  }
}
