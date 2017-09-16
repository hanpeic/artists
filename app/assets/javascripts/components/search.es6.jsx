class Search extends React.Component {
  render () {
    return (
      <div>
        <div>Title: {this.props.title}</div>
      </div>
    );
  }
}

Search.propTypes = {
  title: React.PropTypes.string
};

