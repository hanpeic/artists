class TrackTable extends React.Component {
  
  render () {
    if(this.props.tracks.length === 0) {
      return null;
    }
    var rows = [];
    this.props.tracks.forEach((track) => {
      rows.push(<TrackRow track={track} key={track.name} />);
    });

    return (
      <Table head={<TrackHead />} rows={rows} />
    );
  }
}

function TrackHead() {
  return (
    <tr>
      <th>Name</th>
      <th>Listeners</th>
    </tr>
  );
}
