import Foundation
import MapboxDirections
import MapboxCoreNavigation

/**
 The `NavigationMapViewDelegate` provides methods for configuring the NavigationMapView, as well as responding to events triggered by the NavigationMapView.
 */
public protocol NavigationMapViewDelegate: class, UnimplementedLogging {
    /**
     Asks the receiver to return an MGLStyleLayer for routes, given an identifier and source.
     This method is invoked when the map view loads and any time routes are added.
     - parameter mapView: The NavigationMapView.
     - parameter identifier: The style identifier.
     - parameter source: The Layer source containing the route data that this method would style.
     - returns: An MGLStyleLayer that the map applies to all routes.
     - note: This delegate method includes a default implementation that prints a warning to the console when this method is called. See `UnimplementedLogging` for details.
     */
    func navigationMapView(_ mapView: NavigationMapView, routeStyleLayerWithIdentifier identifier: String, source: MGLSource) -> MGLStyleLayer?
    
    /**
     Asks the receiver to return an MGLStyleLayer for waypoints, given an identifier and source.
     This method is invoked when the map view loads and any time waypoints are added.
     - parameter mapView: The NavigationMapView.
     - parameter identifier: The style identifier.
     - parameter source: The Layer source containing the waypoint data that this method would style.
     - returns: An MGLStyleLayer that the map applies to all waypoints.
     - note: This delegate method includes a default implementation that prints a warning to the console when this method is called. See `UnimplementedLogging` for details.
     */
    func navigationMapView(_ mapView: NavigationMapView, waypointStyleLayerWithIdentifier identifier: String, source: MGLSource) -> MGLStyleLayer?
    
    /**
     Asks the receiver to return an MGLStyleLayer for waypoint symbols, given an identifier and source.
     This method is invoked when the map view loads and any time waypoints are added.
     - parameter mapView: The NavigationMapView.
     - parameter identifier: The style identifier.
     - parameter source: The Layer source containing the waypoint data that this method would style.
     - returns: An MGLStyleLayer that the map applies to all waypoint symbols.
     - note: This delegate method includes a default implementation that prints a warning to the console when this method is called. See `UnimplementedLogging` for details.
     */
    func navigationMapView(_ mapView: NavigationMapView, waypointSymbolStyleLayerWithIdentifier identifier: String, source: MGLSource) -> MGLStyleLayer?
    
    /**
     Asks the receiver to return an MGLStyleLayer for route casings, given an identifier and source.
     This method is invoked when the map view loads and anytime routes are added.
     - note: Specify a casing to ensure good contrast between the route line and the underlying map layers.
     - parameter mapView: The NavigationMapView.
     - parameter identifier: The style identifier.
     - parameter source: The Layer source containing the route data that this method would style.
     - returns: An MGLStyleLayer that the map applies to the route.
     - note: This delegate method includes a default implementation that prints a warning to the console when this method is called. See `UnimplementedLogging` for details.
     */
    func navigationMapView(_ mapView: NavigationMapView, routeCasingStyleLayerWithIdentifier identifier: String, source: MGLSource) -> MGLStyleLayer?
    
    /**
     Tells the receiver that the user has selected a route by interacting with the map view.
     - parameter mapView: The NavigationMapView.
     - parameter route: The route that was selected.
     - note: This delegate method includes a default implementation that prints a warning to the console when this method is called. See `UnimplementedLogging` for details.
     */
    func navigationMapView(_ mapView: NavigationMapView, didSelect route: Route)
    
    /**
     Tells the receiver that a waypoint was selected.
     - parameter mapView: The NavigationMapView.
     - parameter waypoint: The waypoint that was selected.
     - note: This delegate method includes a default implementation that prints a warning to the console when this method is called. See `UnimplementedLogging` for details.
     */
    func navigationMapView(_ mapView: NavigationMapView, didSelect waypoint: Waypoint)
    
    /**
     Asks the receiver to return an MGLShape that describes the geometry of the route.
     - note: The returned value represents the route in full detail. For example, individual `MGLPolyline` objects in an `MGLShapeCollectionFeature` object can represent traffic congestion segments. For improved performance, you should also implement `navigationMapView(_:simplifiedShapeFor:)`, which defines the overall route as a single feature.
     - parameter mapView: The NavigationMapView.
     - parameter routes: The routes that the sender is asking about. The first route will always be rendered as the main route, while all subsequent routes will be rendered as alternate routes.
     - returns: Optionally, a `MGLShape` that defines the shape of the route, or `nil` to use default behavior.
     - note: This delegate method includes a default implementation that prints a warning to the console when this method is called. See `UnimplementedLogging` for details.
     */
    func navigationMapView(_ mapView: NavigationMapView, shapeFor routes: [Route]) -> MGLShape?
    
    /**
     Asks the receiver to return an MGLShape that describes the geometry of the route at lower zoomlevels.
     - note: The returned value represents the simplfied route. It is designed to be used with `navigationMapView(_:shapeFor:), and if used without its parent method, can cause unexpected behavior.
     - parameter mapView: The NavigationMapView.
     - parameter route: The route that the sender is asking about.
     - returns: Optionally, a `MGLShape` that defines the shape of the route at lower zoomlevels, or `nil` to use default behavior.
     - note: This delegate method includes a default implementation that prints a warning to the console when this method is called. See `UnimplementedLogging` for details.
     */
    func navigationMapView(_ mapView: NavigationMapView, simplifiedShapeFor route: Route) -> MGLShape?
    
    /**
     Asks the receiver to return an MGLShape that describes the geometry of the waypoint.
     - parameter mapView: The NavigationMapView.
     - parameter waypoints: The waypoints to be displayed on the map.
     - returns: Optionally, a `MGLShape` that defines the shape of the waypoint, or `nil` to use default behavior.
     - note: This delegate method includes a default implementation that prints a warning to the console when this method is called. See `UnimplementedLogging` for details.
     */
    func navigationMapView(_ mapView: NavigationMapView, shapeFor waypoints: [Waypoint], legIndex: Int) -> MGLShape?
    
    /**
     Asks the receiver to return a CGPoint to serve as the anchor for the user icon.
     - important: The return value should be returned in the normal UIKit coordinate-space, NOT CoreAnimation's unit coordinate-space.
     - parameter mapView: The NavigationMapView.
     - returns: A CGPoint (in regular coordinate-space) that represents the point on-screen where the user location icon should be drawn.
     - note: This delegate method includes a default implementation that prints a warning to the console when this method is called. See `UnimplementedLogging` for details.     
     */
    func navigationMapViewUserAnchorPoint(_ mapView: NavigationMapView) -> CGPoint
    
    //MARK: Obsolete
    
    @available(*, deprecated, message: "The NavigationMapView no longer forwards MGLMapViewDelegate messages. Use MGLMapViewDelegate.mapView(_:imageFor:) instead.")
    
    func navigationMapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage?
    
    @available(*, deprecated, message: "The NavigationMapView no longer forwards MGLMapViewDelegate messages. Use MGLMapViewDelegate.mapView(_:viewFor:) instead.")
    
    func navigationMapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView?
}

public extension NavigationMapViewDelegate {
    func navigationMapView(_ mapView: NavigationMapView, routeStyleLayerWithIdentifier identifier: String, source: MGLSource) -> MGLStyleLayer? {
        logUnimplemented(protocolType: NavigationMapViewDelegate.self, level: .debug)
        return nil
    }
    
    func navigationMapView(_ mapView: NavigationMapView, waypointStyleLayerWithIdentifier identifier: String, source: MGLSource) -> MGLStyleLayer? {
        logUnimplemented(protocolType: NavigationMapViewDelegate.self, level: .debug)
        return nil
    }
    
    func navigationMapView(_ mapView: NavigationMapView, waypointSymbolStyleLayerWithIdentifier identifier: String, source: MGLSource) -> MGLStyleLayer? {
        logUnimplemented(protocolType: NavigationMapViewDelegate.self, level: .debug)
        return nil
    }
    
    func navigationMapView(_ mapView: NavigationMapView, routeCasingStyleLayerWithIdentifier identifier: String, source: MGLSource) -> MGLStyleLayer? {
        logUnimplemented(protocolType: NavigationMapViewDelegate.self, level: .debug)
        return nil
    }
    
    func navigationMapView(_ mapView: NavigationMapView, didSelect route: Route) {
        logUnimplemented(protocolType: NavigationMapViewDelegate.self, level: .debug)
    }
    
    func navigationMapView(_ mapView: NavigationMapView, didSelect waypoint: Waypoint) {
        logUnimplemented(protocolType: NavigationMapViewDelegate.self, level: .debug)
    }
    
    func navigationMapView(_ mapView: NavigationMapView, shapeFor routes: [Route]) -> MGLShape? {
        logUnimplemented(protocolType: NavigationMapViewDelegate.self, level: .debug)
        return nil
    }
    
    func navigationMapView(_ mapView: NavigationMapView, simplifiedShapeFor route: Route) -> MGLShape? {
        logUnimplemented(protocolType: NavigationMapViewDelegate.self, level: .debug)
        return nil
    }
    
    func navigationMapView(_ mapView: NavigationMapView, shapeFor waypoints: [Waypoint], legIndex: Int) -> MGLShape? {
        logUnimplemented(protocolType: NavigationMapViewDelegate.self, level: .debug)
        return nil
    }
    
    func navigationMapViewUserAnchorPoint(_ mapView: NavigationMapView) -> CGPoint {
        logUnimplemented(protocolType: NavigationMapViewDelegate.self, level: .debug)
        return .zero
    }
    
    func navigationMapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
        //no-op, deprecated
        return nil
    }
    
    func navigationMapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        //no-op, deprecated
        return nil
    }
}

// MARK: NavigationMapViewCourseTrackingDelegate
/**
 The `NavigationMapViewCourseTrackingDelegate` provides methods for responding to the `NavigationMapView` starting or stopping course tracking.
 */
public protocol NavigationMapViewCourseTrackingDelegate: class, UnimplementedLogging {
    /**
     Tells the receiver that the map is now tracking the user course.
     - seealso: NavigationMapView.tracksUserCourse
     - parameter mapView: The NavigationMapView.
     */
    func navigationMapViewDidStartTrackingCourse(_ mapView: NavigationMapView)
    
    /**
     Tells the receiver that `tracksUserCourse` was set to false, signifying that the map is no longer tracking the user course.
     - seealso: NavigationMapView.tracksUserCourse
     - parameter mapView: The NavigationMapView.
     */
    func navigationMapViewDidStopTrackingCourse(_ mapView: NavigationMapView)
}

public extension NavigationMapViewCourseTrackingDelegate {
    func navigationMapViewDidStartTrackingCourse(_ mapView: NavigationMapView) {
        logUnimplemented(protocolType: NavigationMapViewDelegate.self, level: .debug)
    }
    
    func navigationMapViewDidStopTrackingCourse(_ mapView: NavigationMapView) {
        logUnimplemented(protocolType: NavigationMapViewDelegate.self, level: .debug)
    }
}
