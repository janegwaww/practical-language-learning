#ifndef VECTOR3D_H_INCLUDED
#define VECTOR3D_H_INCLUDED

#include "Point3d.h"

class Vector3d
{
private:
	double m_x{};
	double m_y{};
	double m_z{};

public:
	Vector3d(double x = 0.0, double y = 0.0, double z = 0.0);

	void print() const;

	friend void Point3d::moveByVector(const Vector3d& v);
};

#endif // VECTOR3D_H_INCLUDED
