class TrackRow extends React.Component {
  render () {
    return (
      <tr>
        <td>{this.props.track.name}</td>
        <td><a href={this.props.track.url} target='_blank'>{this.props.track.listeners}</a></td>
      </tr>
    );
  }
}
