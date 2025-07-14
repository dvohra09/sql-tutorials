-- Create example table
CREATE TABLE locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    coordinates POINT NOT NULL SRID 4326,
    SPATIAL INDEX(coordinates)
);
-- Add example data
INSERT INTO locations (name, coordinates)
VALUES ('Eiffel Tower', ST_PointFromText('POINT(2.2945 48.8584)', 4326));
INSERT INTO locations (name, coordinates)
VALUES ('Arc de Triomphe', ST_PointFromText('POINT(2.2950 48.8738)', 4326));
-- Query example data
SELECT
    ST_Distance_Sphere(t1.coordinates, t2.coordinates) AS Distance_in_Meters 
FROM
    locations AS t1,
    locations AS t2 
WHERE
    t1.name = 'Eiffel Tower' AND t2.name = 'Arc de Triomphe';
