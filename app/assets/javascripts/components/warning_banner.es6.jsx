class WarningBanner extends React.Component {
  render () {
    if(this.props.message === '') {
      return null;
    }
    return (
      <div className="alert alert-danger" style={{textAlign: 'center', marginRight: '30%', marginLeft: '30%'}}>
        Warning!  {this.props.message}
      </div>
    );
  }
}
