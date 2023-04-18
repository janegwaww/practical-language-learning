#ifndef POINT3D_H_INCLUDED
#define POINT3D_H_INCLUDED

class Vector3d;

class Point3d
{
    private:
        double m_x{};
        double m_y{};
        double m_z{};

    public:
        static inline int pp{ 11 };
        Point3d(double x = 0.0, double y = 0.0, double z = 0.0);

        void print() const;

        void moveByVector(const Vector3d& v);
};

#endif // POINT3D_H_INCLUDED
