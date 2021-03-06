class ArtistTable extends React.Component {

  render () {
    if(this.props.artists.length === 0) {
      return null;
    }
    var rows = [];
    this.props.artists.forEach((artist) => {
      rows.push(<ArtistRow artist={artist} key={artist.name} />);
    });

    return (
      <Table head={<ArtistHead />} rows={rows} />
    );
  }
}

function ArtistHead() {
  return (
    <tr>
      <th>Name</th>
      <th>Img</th>
    </tr>
  );
}
