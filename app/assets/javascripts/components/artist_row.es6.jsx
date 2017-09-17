class ArtistRow extends React.Component {
  render () {
    return (
      <tr>
        <td>{this.props.artist.name}</td>
        <td><a href={'/artists/' + this.props.artist.name} target='_blank'><img src={this.props.artist.image[2]['#text']} alt="Tracks" /></a></td>
      </tr>
    );
  }
}
