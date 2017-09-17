class Table extends React.Component {
  render () {
    return (
      <table style={{marginLeft: 'auto', marginRight: 'auto'}}>
        <thead>
          {this.props.head}
        </thead>
        <tbody>{this.props.rows}</tbody>
      </table>
    );
  }
}


